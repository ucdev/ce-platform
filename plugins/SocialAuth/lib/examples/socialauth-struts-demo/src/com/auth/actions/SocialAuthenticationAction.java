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

import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.util.RequestUtils;
import org.brickred.socialauth.SocialAuthConfig;
import org.brickred.socialauth.SocialAuthManager;

import com.auth.form.AuthForm;

/**
 * 
 * It redirects the browser to an appropriate URL which will be used for
 * authentication with the provider that has been set by clicking the icon. It
 * creates an instance of the requested provider from AuthProviderFactory and
 * calls the getLoginRedirectURL() method to find the URL which the user should
 * be redirect to.
 * 
 * @author tarunn@brickred.com
 * 
 */
public class SocialAuthenticationAction extends Action {

	final Log LOG = LogFactory.getLog(SocialAuthenticationAction.class);

	/**
	 * creates a instance of the requested provider from AuthProviderFactory and
	 * calls the getLoginRedirectURL() method to find the URL which the user
	 * should be redirect to.
	 * 
	 * @param mapping
	 *            the action mapping
	 * @param form
	 *            the action form
	 * @param request
	 *            the http servlet request
	 * @param response
	 *            tc the http servlet response
	 * @return ActionForward where the action should flow
	 * @throws Exception
	 *             if an error occurs
	 */

	@Override
	public ActionForward execute(final ActionMapping mapping,
			final ActionForm form, final HttpServletRequest request,
			final HttpServletResponse response) throws Exception {

		AuthForm authForm = (AuthForm) form;

		String id = authForm.getId();
		SocialAuthManager manager;
		if (authForm.getSocialAuthManager() != null) {
			manager = authForm.getSocialAuthManager();
			if ("signout".equals(request.getParameter("mode"))) {
				manager.disconnectProvider(id);
				return mapping.findForward("home");
			}
		} else {
			InputStream in = SocialAuthenticationAction.class.getClassLoader()
					.getResourceAsStream("oauth_consumer.properties");
			SocialAuthConfig conf = SocialAuthConfig.getDefault();
			conf.load(in);
			manager = new SocialAuthManager();
			manager.setSocialAuthConfig(conf);
			authForm.setSocialAuthManager(manager);
		}

		String returnToUrl = RequestUtils.absoluteURL(request,
				"/socialAuthSuccessAction.do").toString();
		String url = manager.getAuthenticationUrl(id, returnToUrl);
		LOG.info("Redirecting to: " + url);
		if (url != null) {
			ActionForward fwd = new ActionForward("openAuthUrl", url, true);
			return fwd;
		}
		return mapping.findForward("failure");
	}
}
