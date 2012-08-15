/*
 ===========================================================================
 Copyright (c) 2010 BrickRed Technologies Limited

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sub-license, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 ===========================================================================

 */

package org.brickred.socialauth.provider;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Serializable;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.brickred.socialauth.AuthProvider;
import org.brickred.socialauth.Contact;
import org.brickred.socialauth.Permission;
import org.brickred.socialauth.Profile;
import org.brickred.socialauth.util.AccessGrant;
import org.brickred.socialauth.util.OAuthConfig;
import org.brickred.socialauth.util.Response;

/**
 * The implementation for the AOL provider. AOL returns very limited profile
 * information and has no implementation for status updates and getting
 * contacts. May be removed in future.
 * 
 * @author abhinavm@brickred.com
 * 
 */
public class AolImpl implements AuthProvider, Serializable {

	private static final long serialVersionUID = -7393140704663678118L;

	private static Pattern nameValSplitter = Pattern.compile("[=&]",
			Pattern.CASE_INSENSITIVE);

	private String dev_id;
	private String token;
	private String redirectUri;
	private OAuthConfig config;
	private final Log LOG = LogFactory.getLog(AolImpl.class);

	/**
	 * Reads properties provided in the configuration file
	 * 
	 * @param props
	 *            Properties for consumer key
	 */
	public AolImpl(final OAuthConfig providerConfig) {
		config = providerConfig;
		dev_id = config.get_consumerKey();
	}

	@Override
	public void setAccessGrant(final AccessGrant accessGrant) {
	}

	/**
	 * This is the most important action. It redirects the browser to an
	 * appropriate URL which will be used for authentication with the provider
	 * that has been set using setId()
	 * 
	 * @throws Exception
	 */
	@Override
	public String getLoginRedirectURL(final String redirectUri) {
		this.redirectUri = redirectUri;
		return "https://api.screenname.aol.com/auth/login?f=qs" + "&succUrl="
				+ redirectUri + "&devId=" + dev_id;
	}

	/**
	 * Verifies the user when the external provider redirects back to our
	 * application.
	 * 
	 * @return Profile object containing the profile information
	 * @param request
	 *            Request object the request is received from the provider
	 * @throws Exception
	 */

	@Override
	public Profile verifyResponse(final HttpServletRequest request) {
		try {
			// retrieve and validate the token by calling OpenAuth getInfo
			token = request.getParameter("token_a");
			String encodedToken = URLEncoder.encode(token, "UTF-8");

			String getInfoUrl = "https://api.screenname.aol.com/auth/getInfo?"
					+ "f=qs" + "&devId=" + dev_id + "&referer=" + redirectUri
					+ "&a=" + encodedToken;
			Map responseParamMap = getHttpResponseParameters(getInfoUrl);
			String statusCode = (String) responseParamMap.get("statusCode");
			if ((statusCode != null) && (statusCode.equals("200"))) {
				Profile p = new Profile();
				p.setFullName((String) responseParamMap
						.get("userData_displayName"));
				String[] str = p.getFullName().split(" ");
				p.setFirstName(str[0]);
				p.setLastName(str.length > 1 ? str[1] : " ");
				p.setEmail((String) responseParamMap.get("userData_loginId"));
				p.setValidatedId((String) responseParamMap
						.get("userData_loginId"));
				return p;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	private Map getHttpResponseParameters(final String Url)
			throws MalformedURLException, IOException {
		URL getInfo = new URL(Url);
		String getInfoResponse;
		StringBuffer responseBuf = new StringBuffer();
		BufferedReader in = new BufferedReader(new InputStreamReader(
				getInfo.openStream()));
		String inputLine;
		while ((inputLine = in.readLine()) != null) {
			responseBuf.append(inputLine);
		}
		getInfoResponse = responseBuf.toString();
		String[] nameValuePairs = nameValSplitter.split(getInfoResponse);
		Map responseParamMap = new HashMap();
		for (int i = 0; i < nameValuePairs.length; i += 2) {
			responseParamMap.put(nameValuePairs[i],
					URLDecoder.decode(nameValuePairs[i + 1]));
		}
		return responseParamMap;
	}

	/**
	 * Gets the list of contacts of the user and their email. this may not be
	 * available for all providers.
	 * 
	 * @return List of profile objects representing Contacts. Only name and
	 *         email will be available
	 */

	@Override
	public List<Contact> getContactList() {
		List<Contact> plist = new ArrayList<Contact>();
		try {
			// HttpClient client = new HttpClient();

			String encodedToken = URLEncoder.encode(token, "UTF-8");
			String u = "http://api.oscar.aol.com/presence/get?f=json&bl=1&k="
					+ dev_id + "&a=" + encodedToken;
			URL connURL = new URL(u);
			HttpURLConnection urlConn = (HttpURLConnection) connURL
					.openConnection();
			urlConn.setRequestProperty("referer",
					"http://localhost:8080/AuthApp/");
			StringBuffer responseBuf = new StringBuffer();
			BufferedReader in = new BufferedReader(new InputStreamReader(
					urlConn.getInputStream(), "UTF-8"));
			String inputLine;
			while ((inputLine = in.readLine()) != null) {
				responseBuf.append(inputLine);
			}
			LOG.debug(responseBuf.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return plist;
	}

	/**
	 * Updates the status on the chosen provider if available. This may not be
	 * implemented for all providers.
	 * 
	 * @param msg
	 *            Message to be shown as user's status
	 */

	@Override
	public void updateStatus(final String msg) {
		LOG.warn("Update status not implemented");
	}

	/**
	 * Logout
	 */
	@Override
	public void logout() {
		token = null;
	}

	/**
	 * 
	 * @param p
	 *            Permission object which can be Permission.AUHTHENTICATE_ONLY,
	 *            Permission.ALL, Permission.DEFAULT
	 */
	@Override
	public void setPermission(final Permission p) {
		LOG.debug("Permission requested : " + p.toString());
	}

	@Override
	public Response api(final String url, final String methodType,
			final Map<String, String> params,
			final Map<String, String> headerParams, final String body)
			throws Exception {
		return null;
	}

	/**
	 * Retrieves the user profile.
	 * 
	 * @return Profile object containing the profile information.
	 */
	@Override
	public Profile getUserProfile() {
		return null;
	}

	@Override
	public AccessGrant getAccessGrant() {
		return null;
	}

	@Override
	public Profile verifyResponse(final Map<String, String> requestParams)
			throws Exception {
		return null;
	}

	@Override
	public String getProviderId() {
		return config.getId();
	}
}