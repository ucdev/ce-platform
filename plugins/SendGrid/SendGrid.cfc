<cfcomponent output="false">
	<cffunction name="init">
		<cfset this.version = "1.1.5">
		<cfreturn this>
	</cffunction>
	
	<cffunction name="SendGridInit" access="public" returntype="string">
		<cfargument name="api_user" type="string" required="yes" hint="">
		<cfargument name="api_key" type="string" required="yes" hint="">
		
		<!--- init sendgrid cfc --->
		<cfset application['sendgrid'] = createObject("plugins.SendGrid.lib.SendGrid").init(arguments.api_user,arguments.api_key) />
		
		<cfreturn true />
	</cffunction>
	
	<!---<cffunction name="sendEmail" returntype="string" access="public" output="false">
		<cfreturn core.sendEmail(argumentCollection=arguments) />
	</cffunction>--->
	
	<cffunction name="smtpApiData" access="public" output="false" returntype="string">
		<cfargument name="to" type="array" required="no" hint='<strong>To:</strong> An array of addresses to send the message to.<br />
		<code>{&quot;to&quot;: [&quot;ben@sendgrid.com&quot;, &quot;joe@sendgrid.com&quot;]}</code>' />
		<cfargument name="sub" type="struct" required="no" hint='Substitution: An associative array of substitution tags, where each tag is associated with a list of replacement text for the tag in the body text. Each Substitution value corresponds to an email in the "To" section of the JSON string.<br />
		<code>{"sub":{"%name%": ["Ben", "Joe"], "%role%": ["%sellerSection%", "%buyerSection%"]}}</code>' />
		<cfargument name="section" type="struct" required="no" hint='Section: Sections can be used to simplify substitution values that are common to many recipients. This is an associative array of sections that can be used in substitution values.<br />
		<code>{"section":{"%sellerSection%": "Seller information for: %name%", "%buyerSection%": "Buyer information for: %name%"}}</code>' />
		<cfargument name="category" type="array" required="no" hint='Category: Associates the category of email this should be logged as. You may insert up to 10 categories as an array, these categories are not predefined.<br />
		<code>{"category": ["category1”,”category2”]}</code>' />
		<cfargument name="unique_args" type="struct" required="no" hint='Unique Arguments: An associative array of arguments and their values to be applied to all emails sent in this SMTP API transaction.<br />
		<code>{"unique_args": {"orderNumber": "12345", "eventID": "6789"}}</code>' />
		<cfargument name="filters" type="struct" required="no" hint='Filters: An associative array of filters and their settings, used to override filter settings already setup for your account. Settings are an associative array of the setting names and their values.<br />
		<code>{"filters": {"footer": {"settings": {"enable":1,"text/plain": "Thank you for your business"}}}}</code>' />
		
		<cfset var loc = structNew() />
		<cfset loc['args'] = duplicate(arguments) />
		<cfset loc['x-smtpapi'] = {} />
		<cfset loc['options'] = { 
				'to': { 'type':'array' },
				'sub': { 'type':'struct' },
				'section': { 'type':'struct' },
				'category': { 'type':'array' },
				'unique_args': { 'type':'struct' },
				'filters': { 'type':'struct' }
		} />
		
		<cfloop list="#structKeyList(loc.options)#" index="key" delimiters=",">
			<cfset loc.option = loc.options[key] />
			
			<cfif structKeyExists(loc.args,key)>
				<cfif (loc.option.type EQ 'array' AND arrayLen(loc.args[key]) GT 0) OR (loc.option.type EQ 'struct' AND listLen(structKeyList(loc.args[key]),',') GT 0)>
					<cfset loc['x-smtpapi'][key] = loc.args[key] />
				</cfif>
			</cfif>
		</cfloop>
		
		<cfreturn serializeJson(loc['x-smtpapi']) />
	</cffunction>
</cfcomponent>