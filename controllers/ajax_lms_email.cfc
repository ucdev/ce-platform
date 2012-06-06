<!--- THIS IS FOR JUSTINS WEBSITE PROJECT // PLEASE IGNORE FILE --->
<cfcomponent extends="controller">
	<cffunction name="send"  returntype="string">
		<cfparam name="params.name" type="string" required="yes">
		<cfparam name="params.email" type="string" required="yes">
		<cfparam name="params.reason" type="string" required="yes">
		<cfparam name="params.comments" type="string" required="yes">
        <cfparam name="params.callback" type="string" required="yes">
        
        <cfset var status = createObject("component", "#application.settings.com#returnData.buildStruct").init()>
        
        <cfmail to="jslamka5685@gmail.com;#arguments.email#" from="#arguments.email#" bcc="jslamka5685@gmail.com" subject="Rose & Crown Inquiry" replyto="noreply@rosecrownhookah.com">
			<cfmailpart type="html">
				<body style="background-color:##f7f7f7;font-family:Arial, Helvetica, sans-serif;font-size:12px;">
				<table cellspacing="0" cellpadding="0" border="0" width="620">
					<tbody>
						<tr>
							<td style="background: none repeat scroll 0% 0% ##333; color: rgb(255, 255, 255); font-weight: bold;font-family:Arial, Helvetica, sans-serif; padding: 4px 8px; vertical-align: middle; font-size: 16px; letter-spacing: -0.03em; text-align: left;"><a target="_blank" href="https://ccpd.uc.edu/" style="color: rgb(255, 255, 255); text-decoration: none;"><span style="color: rgb(255, 255, 255);">ROSE &amp; CROWN HOOKAH LOUNGE</span></a></td>
							<td style="background: none repeat scroll 0% 0% ##333; color: rgb(255, 255, 255); font-weight: bold;font-family:Arial, Helvetica, sans-serif; padding: 4px 8px; vertical-align: middle; font-size: 11px; text-align: right;"></td>
						</tr>
						<tr>
							<td valign="top" style="background-color: rgb(255, 255, 255); border-bottom: 1px solid rgb(59, 89, 152); border-left: 1px solid rgb(204, 204, 204); border-right: 1px solid rgb(204, 204, 204); font-family: Arial, Helvetica, sans-serif; padding: 15px;" colspan="2">
								<strong>NAME: </strong>#arguments.name#
							</td>
                        </tr>
                        <cfif len(trim(arguments.reason)) GT 0>
						<tr>
							<td valign="top" style="background-color: rgb(255, 255, 255); border-bottom: 1px solid rgb(59, 89, 152); border-left: 1px solid rgb(204, 204, 204); border-right: 1px solid rgb(204, 204, 204); font-family: Arial, Helvetica, sans-serif; padding: 15px;" colspan="2">
								<strong>REASON: </strong>#arguments.reason#
							</td>
                        </tr>
                        </cfif>
						<tr>
							<td valign="top" style="background-color: rgb(255, 255, 255); border-bottom: 1px solid rgb(59, 89, 152); border-left: 1px solid rgb(204, 204, 204); border-right: 1px solid rgb(204, 204, 204); font-family: Arial, Helvetica, sans-serif; padding: 15px;" colspan="2">
								<strong>COMMENTS:</strong> #arguments.comments#
							</td>
						</tr>
					</tbody>
				</table>
				</body>
			</cfmailpart>
                <cfmailpart type="plain">
                NAME: #arguments.name#
                <cfif len(trim(arguments.reason)) GT 0>
                REASON: #arguments.reason#
                </cfif>
                
                COMMENTS: #arguments.comments#
            </cfmailpart>
        </cfmail>
        
        <cfset status.setStatus(true)>
        <cfset status.setStatusMsg("Your email has been sent.")>
        
		<cfreturn arguments.callback & "(" & status.getJSON() & ")" />
	</cffunction>
</cfcomponent>