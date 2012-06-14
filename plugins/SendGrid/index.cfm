<!--- get the available templates from the template folder --->
<cfset templates = getTemplates()>

<h1>SendGrid</h1>

<p>This plugin will enable you to interact with the SendGrid WebAPI as well as aid in SMTP API packaging in your application, to use it, follow the instructions below.</p>

<h2>Instructions</h2>

<ul>
	<li>Add this line to your /events/onapplicationstart.cfm<br />
		<code>&lt;cfset sendGridInit('&lt;your_sendgrid_username&gt;','&lt;your_sendgrid_password&gt;') /&gt;</code>
	</li>
	<li>Reload CFWHEELS</li>
	<li>Now, you can begin integrating sendgrid into your application.  See the SendGrid WebAPI documentation for more information.</li>
</ul>

<h2>Generate form</h2>

<cfif isDefined("FORM.objectToScaffold") AND isDefined("FORM.typeOfScaffold")>
    
    <cfoutput>
    	<p><tt>#generateScaffold(FORM.objectToScaffold, FORM.typeOfScaffold, FORM.template)#</tt></p>
    </cfoutput>
    
    <p>Create another one?</p>
    
<cfelse>

	<p><tt>Example: If your table is named "users", insert "user" in the form field below.</tt></p>
    
</cfif>

<!--- Form --->
<cfform action="#CGI.script_name & '?' & CGI.query_string#">
	<p><label for="objectToScaffold">Object name</label> <br>
	<cfinput type="text" name="objectToScaffold" required="true"  message="An Object name is required"></p>
	
	<p><label for="typeOfScaffold">Type</label> <br>
	<cfselect name="typeOfScaffold" required="true" message="A Type is required">
		<option value="everything" selected="selected">Model, Views and Controller</option>
		<option value="model_controller" selected="selected">Model and Controller</option>
		<option value="view_controller" selected="selected">View and Controller</option>
		<option value="controller">Controller</option>
		<option value="view">View</option>
		<option value="model">Model</option>
	</cfselect>
	</p>
	
	<p>
	    <label for="template">Template</label> <br>
	    <cfselect name="template">
	        <cfoutput query="templates">
	            <cfif type is "DIR">
	                <option value="#name#">#name#</option>
	            </cfif>
	        </cfoutput>
    	</cfselect>
	</p>	
	
	<p><cfinput type="submit" name="btnSubmit" value="Generate"></p>
	
</cfform>

<a href="<cfoutput>#cgi.http_referer#</cfoutput>"><<< Go Back</a>