/**
  * @output false
  * @displayname SocialAuth for CFWHEELS Controller
  * @hint I am SocialAuth Controller
  * @extends Controller
  */
component extends="Controller" {
	public string function init() {

	}
	/*
	 * @name login
	 * @output false
	 * @description I will send a user to the social network login screen of their choosing.
	 * @hint I will send a user to the social network login screen of their choosing.
	 */
	public string function login() {
		id = params.key;
		configFile = expandPath("/plugins/SocialAuth/oauth_config.properties");
		inputFile = createObject("java","java.io.File").init(configFile);
		inputStream = createObject("java", "java.io.FileInputStream").init(inputFile);
		
		SocialAuthConfig = createObject("java","org.brickred.socialauth.SocialAuthConfig");
		config = SocialAuthConfig.getDefault();
		config.load(configFile);
		
		SocialAuthManager = createObject("java","org.brickred.socialauth.SocialAuthManager");
		manager = SocialAuthManager;
		manager.setSocialAuthConfig(config);
		successUrl = "http://dev.ccpd.uc.edu/socialauth/success";
		providerUrl = manager.getAuthenticationUrl("facebook", successUrl);

		//Create an instance of SocialAuthConfgi object
		/*
		SocialAuthConfig config = SocialAuthConfig.getDefault();

		//load configuration. By default load the configuration from oauth_consumer.properties. 
		//You can also pass input stream, properties object or properties file name.
		config.load(configFile);

		//Create an instance of SocialAuthManager and set config
		SocialAuthManager manager = new SocialAuthManager();
		manager.setSocialAuthConfig(config);

		// URL of YOUR application which will be called after authentication
		String successUrl= "http://opensource.brickred.com/socialauthdemo/socialAuthSuccessAction.do";

		// get Provider URL to which you should redirect for authentication.
		// id can have values "facebook", "twitter", "yahoo" etc. or the OpenID URL
		String url = manager.getAuthenticationUrl(id, successUrl);

		// Store in session
		session.setAttribute("authManager", manager);
		*/
	}
}
