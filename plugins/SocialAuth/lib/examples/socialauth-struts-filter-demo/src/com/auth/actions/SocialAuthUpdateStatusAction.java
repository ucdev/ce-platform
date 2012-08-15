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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.brickred.socialauth.AuthProvider;
import org.brickred.socialauth.SocialAuthManager;
import org.brickred.socialauth.exception.SocialAuthException;

import de.deltatree.social.web.filter.api.SASFHelper;
import de.deltatree.social.web.filter.api.SASFStaticHelper;

/**
 * This is for updating status. After verification we call the updateStatus()
 * method to update status on that provider.
 * 
 * @author tarunn@brickred.com
 * 
 */
public class SocialAuthUpdateStatusAction extends Action {

	final Log LOG = LogFactory.getLog(SocialAuthUpdateStatusAction.class);

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
		String statusMsg = request.getParameter("statusMessage");
		if (statusMsg == null || statusMsg.trim().length() == 0) {
			request.setAttribute("Message", "Status can't be left blank.");
			return mapping.findForward("failure");
		}

		SASFHelper helper = SASFStaticHelper.getHelper(request);
		SocialAuthManager manager = helper.getAuthManager();

		AuthProvider provider = null;
		if (manager != null) {
			provider = manager.getCurrentAuthProvider();
		}
		if (provider != null) {
			try {
				provider.updateStatus(statusMsg);
				request.setAttribute("Message", "Status Updated successfully");
				return mapping.findForward("success");
			} catch (SocialAuthException e) {
				request.setAttribute("Message", e.getMessage());
				e.printStackTrace();
			}
		}
		// if provider null
		return mapping.findForward("failure");
	}
}
