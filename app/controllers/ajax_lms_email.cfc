<!--- THIS IS FOR JUSTINS WEBSITE PROJECT // PLEASE IGNORE FILE --->
<cfcomponent extends="controller">
	<cffunction name="send" >
		<cfparam name="params.name" type="string" >
		<cfparam name="params.email" type="string" >
		<cfparam name="params.reason" type="string" >
		<cfparam name="params.comments" type="string" >
        <cfparam name="params.callback" type="string" >
        
        <cfset var status = createObject("component", "#application.settings.com#returnData.buildStruct").init()>
        
        <cfmail to="jslamka5685@gmail.com;#params.email#" from="#params.email#" bcc="jslamka5685@gmail.com" subject="Rose & Crown Inquiry" replyto="noreply@rosecrownhookah.com">
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
								<strong>NAME: </strong>#params.name#
							</td>
                        </tr>
                        <cfif len(trim(params.reason)) GT 0>
						<tr>
							<td valign="top" style="background-color: rgb(255, 255, 255); border-bottom: 1px solid rgb(59, 89, 152); border-left: 1px solid rgb(204, 204, 204); border-right: 1px solid rgb(204, 204, 204); font-family: Arial, Helvetica, sans-serif; padding: 15px;" colspan="2">
								<strong>REASON: </strong>#params.reason#
							</td>
                        </tr>
                        </cfif>
						<tr>
							<td valign="top" style="background-color: rgb(255, 255, 255); border-bottom: 1px solid rgb(59, 89, 152); border-left: 1px solid rgb(204, 204, 204); border-right: 1px solid rgb(204, 204, 204); font-family: Arial, Helvetica, sans-serif; padding: 15px;" colspan="2">
								<strong>COMMENTS:</strong> #params.comments#
							</td>
						</tr>
					</tbody>
				</table>
				</body>
			</cfmailpart>
                <cfmailpart type="plain">
                NAME: #params.name#
                <cfif len(trim(params.reason)) GT 0>
                REASON: #params.reason#
                </cfif>
                
                COMMENTS: #params.comments#
            </cfmailpart>
        </cfmail>
        
        <cfset status.setStatus(true)>
        <cfset status.setStatusMsg("Your email has been sent.")>
        
		<cfset renderText(params.callback & "(" & status.getJSON() & ")") />
	</cffunction>
</cfcomponent>