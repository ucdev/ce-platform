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
package com.auth.actions;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.brickred.socialauth.AuthProvider;
import org.brickred.socialauth.Contact;
import org.brickred.socialauth.Profile;
import org.brickred.socialauth.SocialAuthManager;
import org.brickred.socialauth.util.SocialAuthUtil;

import com.auth.form.AuthForm;

/**
 * Verifies the user when the external provider redirects back to our
 * application. It gets the instance of the requested provider from session and
 * calls verifyResponse() method which verifies the user and returns profile
 * information. After verification we call the getContactList() method to get
 * the contacts.
 * 
 * @author tarunn@brickred.com
 * 
 */
public class SocialAuthSuccessAction extends Action {

	final Log LOG = LogFactory.getLog(SocialAuthSuccessAction.class);

	/**
	 * Displays the user profile and contacts for the given provider.
	 * 
	 * @param mapping
	 *            the action mapping
	 * @param form
	 *            the action form
	 * @param request
	 *            the http servlet request
	 * @param response
	 *            the http servlet response
	 * @return ActionForward where the action should flow
	 * @throws Exception
	 *             if an error occurs
	 */

	@Override
	public ActionForward execute(final ActionMapping mapping,
			final ActionForm form, final HttpServletRequest request,
			final HttpServletResponse response) throws Exception {

		AuthForm authForm = (AuthForm) form;
		SocialAuthManager manager = null;
		if (authForm.getSocialAuthManager() != null) {
			manager = authForm.getSocialAuthManager();
		}
		if (manager != null) {
			List<Contact> contactsList = new ArrayList<Contact>();
			Profile profile = null;
			try {
				Map<String, String> paramsMap = SocialAuthUtil
						.getRequestParametersMap(request);
				AuthProvider provider = manager.connect(paramsMap);

				profile = provider.getUserProfile();
				contactsList = provider.getContactList();
				if (contactsList != null && contactsList.size() > 0) {
					for (Contact p : contactsList) {
						if (StringUtils.isEmpty(p.getFirstName())
								&& StringUtils.isEmpty(p.getLastName())) {
							p.setFirstName(p.getDisplayName());
						}
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.setAttribute("profile", profile);
			request.setAttribute("contacts", contactsList);

			return mapping.findForward("success");
		}
		// if provider null
		return mapping.findForward("failure");
	}
}
