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
package org.brickred.socialauth.util;

import java.io.Serializable;

/**
 * It contains the configuration of application like consumer key and consumer
 * secret
 * 
 * @author tarunn@brickred.com
 * 
 */
public class OAuthConfig implements Serializable {

	private static final long serialVersionUID = 7574560869168900919L;
	private final String _consumerKey;
	private final String _consumerSecret;
	private final String _signatureMethod;
	private final String _transportName;
	private String id;
	private Class<?> providerImplClass;
	private String customPermissions;

	/**
	 * 
	 * @param consumerKey
	 *            Application consumer key
	 * @param consumerSecret
	 *            Application consumer secret
	 * @param signatureMethod
	 *            Signature Method type
	 * @param transportName
	 *            Transport name
	 */
	public OAuthConfig(final String consumerKey, final String consumerSecret,
			final String signatureMethod, final String transportName) {
		_consumerKey = consumerKey;
		_consumerSecret = consumerSecret;
		if (signatureMethod == null || signatureMethod.length() == 0) {
			_signatureMethod = Constants.HMACSHA1_SIGNATURE;
		} else {
			_signatureMethod = signatureMethod;
		}
		if (transportName == null || transportName.length() == 0) {
			_transportName = MethodType.GET.toString();
		} else {
			_transportName = transportName;
		}
	}

	public OAuthConfig(final String consumerKey, final String consumerSecret) {
		_consumerKey = consumerKey;
		_consumerSecret = consumerSecret;
		_transportName = MethodType.GET.toString();
		_signatureMethod = Constants.HMACSHA1_SIGNATURE;
	}

	/**
	 * Retrieves the consumer key
	 * 
	 * @return the consumer key
	 */
	public String get_consumerKey() {
		return _consumerKey;
	}

	/**
	 * Retrieves the consumer secret
	 * 
	 * @return the consumer secret
	 */
	public String get_consumerSecret() {
		return _consumerSecret;
	}

	/**
	 * Retrieves the signature method
	 * 
	 * @return the signature method
	 */
	public String get_signatureMethod() {
		return _signatureMethod;
	}

	/**
	 * Retrieves the transport name
	 * 
	 * @return the transport name
	 */
	public String get_transportName() {
		return _transportName;
	}

	/**
	 * Retrieves the provider id
	 * 
	 * @return the provider id
	 */
	public String getId() {
		return id;
	}

	/**
	 * Updates the provider id
	 * 
	 * @param id
	 *            the provider id
	 */
	public void setId(final String id) {
		this.id = id;
	}

	/**
	 * Retrieves the provider implementation class
	 * 
	 * @return the provider implementation class
	 */
	public Class<?> getProviderImplClass() {
		return providerImplClass;
	}

	/**
	 * Updates the provider implementation class
	 * 
	 * @param providerImplClass
	 *            the provider implementation class
	 */
	public void setProviderImplClass(final Class<?> providerImplClass) {
		this.providerImplClass = providerImplClass;
	}

	@Override
	public String toString() {
		StringBuilder result = new StringBuilder();
		String NEW_LINE = System.getProperty("line.separator");
		result.append(this.getClass().getName() + " Object {" + NEW_LINE);
		result.append(" consumerKey: " + _consumerKey + NEW_LINE);
		result.append(" consumerSecret: " + _consumerSecret + NEW_LINE);
		result.append(" signatureMethod: " + _signatureMethod + NEW_LINE);
		result.append(" transportName: " + _transportName + NEW_LINE);
		result.append(" id: " + id + NEW_LINE);
		result.append(" providerImplClass: " + providerImplClass + NEW_LINE);
		result.append(" customPermissions: " + customPermissions + NEW_LINE);
		result.append("}");
		return result.toString();
	}

	public String getCustomPermissions() {
		return customPermissions;
	}

	public void setCustomPermissions(final String customPermissions) {
		this.customPermissions = customPermissions;
	}

}
