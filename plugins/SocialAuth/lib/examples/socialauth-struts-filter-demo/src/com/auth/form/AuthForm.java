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
package com.auth.form;

import org.apache.struts.action.ActionForm;
import org.brickred.socialauth.SocialAuthManager;

/**
 * Form bean for storing the socialauth manager in session.
 * 
 * @author tarunn@brickred.com
 * 
 */
public class AuthForm extends ActionForm {
	/**
	 * Id, denoted the auth provider type
	 */
	String id;

	/**
	 * The SocialAuth Manager
	 */
	SocialAuthManager socialAuthManager;

	/**
	 * Retrieves the id
	 * 
	 * @return String the id
	 */
	public String getId() {
		return id;
	}

	/**
	 * Updates the id
	 * 
	 * @param id
	 *            the id of requested provider. It can be google, yahoo,
	 *            hotmail, twitter, facebook or URL of OpenID.
	 */
	public void setId(final String id) {
		this.id = id;
	}

	/**
	 * Retrieves the socialauth manager
	 * 
	 * @return the SocialAuth Manager
	 */
	public SocialAuthManager getSocialAuthManager() {
		return socialAuthManager;
	}

	/**
	 * Updates the socialauth manager
	 * 
	 * @param socialAuthManager
	 */
	public void setSocialAuthManager(final SocialAuthManager socialAuthManager) {
		this.socialAuthManager = socialAuthManager;
	}
}
