<h1>Keyless Entry</h1>

<p>This plugin will generate common user authentication code for your CFWheels application.</p>

<h2>Current Features</h2>

<ul>
  <li>Generates basic controllers, models and views to get up and running quickly.</li>
  <li>Provides basic user authentication.</li>
  <li>Provides a sign-up form to allow new user creation.</li>
  <li>Adds methods to your Wheels app to set as filters to require login.</li>
  <li>Uses email validation prior to activation via email.</li>
</ul>

<cfif structKeyExists(form, 'btnSubmit')>
  
  <h2>Creating Files...</h2>

  <cfoutput>
  	<p><tt>#generateAuthCode()#</tt></p>
  </cfoutput>
  
  <h2>Next Steps</h2>
  
  <p>
    Next, open your routes file and add the following named routes:
    <br/>
    
    <tt>
      &lt;cfset addRoute(name="login", pattern="login", controller="sessions", action="new")&gt;<br/>
      &lt;cfset addRoute(name="logout", pattern="logout", controller="sessions", action="destroy")&gt;<br/>
      &lt;cfset addRoute(name="signup", pattern="signup", controller="users", action="new")&gt;<br/>
      &lt;cfset addRoute(name="activate", pattern="activation/[activationCode]", controller="activations", action="activate")&gt;<br/>
    </tt>
  </p>
  
  <p>
    After that, open the Settings.cfm file for your environment and add your mail server settings:<br/>
    
    <tt>
      &lt;cfset set(functionName="sendEmail", server="", username="", password="")&gt;
    </tt>
  </p>

  <p>
    Open the events/onrequeststart.cfm and add the following line. This configures the 'To' email address from which the email is sent.<br/>
    <tt>
      &lt;cfset request.signup_from_email_address = "you@domain.com"&gt;
    </tt>
  </p>
  
  <p>
    Make sure you have the db-migrate plugin installed (http://cfwheels.org/plugins/listing/28).<br/><br/>

    And run the migration: 20110315091458_Create_Users_Table.cfc
  </p>
  
  <p>
    Now you can click <a href="<cfoutput>#CGI.script_name#</cfoutput>/signup">here to create an account</a>!
  </p>
  
<cfelse>
  
  <h2>Generate Code</h2>
  
  <!--- Form --->
  <cfform action="#CGI.script_name & '?' & CGI.query_string#" method="post">
    
  	<p><cfinput type="submit" name="btnSubmit" value="Generate"></p>
	
  </cfform>
  
</cfif>


<a href="<cfoutput>#cgi.http_referer#</cfoutput>"><<< Go Back</a>