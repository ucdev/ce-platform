<cfcomponent>
	<cfset Errors = "">
	<cfif CGI.SERVER_NAME EQ "ccpd.uc.edu">
		<cfset TheMode = "LIVE">
	<cfelse>
		<cfset TheMode = "TEST">
	</cfif>
	
	<cfswitch expression="#TheMode#">
		<cfcase value="TEST">
			<cfset SerialNumber = "000560847792">
			<cfset PostURL = "https://developer.skipjackic.com/scripts/evolvcc.dll?Authorize">
		</cfcase>
		<cfcase value="LIVE">
			<cfset SerialNumber = "000327677495">
			<cfset PostURL = "https://www.skipjackic.com/scripts/evolvcc.dll?Authorize">
		</cfcase>
	</cfswitch>
	
	<cffunction name="ProcessPayment" access="remote" output="yes" returntype="boolean">
		<cfargument name="ActivityID" type="string" required="yes">
		<cfargument name="AttendeeID" type="string" required="yes">
		<cfargument name="Phone" type="string" required="yes">
		<cfargument name="Address1" type="string" required="yes">
		<cfargument name="Address2" type="string" required="no" default="">
		<cfargument name="City" type="string" required="yes">
		<cfargument name="State" type="string" required="yes">
		<cfargument name="ZipCode" type="string" required="yes">
		<cfargument name="CardName" type="string" required="yes">
		<cfargument name="CardType" type="string" required="yes">
		<cfargument name="CardNumber" type="string" required="yes">
		<cfargument name="CardExpireMonth" type="string" required="yes">
		<cfargument name="CardExpireYear" type="string" required="yes">
        
        <cfset Status = "">
		
		<!--- GET PUB GENERAL --->
		<cfset Activity = createobject("component","#Application.Settings.Com#Activity.Activity").Init(ActivityID=Arguments.ActivityID)>
		<cfset Activity = Application.Com.ActivityDAO.Read(Activity)>
		
		<cfset PubInfo = createobject("component","#Application.Settings.Com#ActivityPubGeneral.ActivityPubGeneral").Init(ActivityID=Arguments.ActivityID)>
		<cfset PubInfo = Application.Com.ActivityPubGeneralDAO.Read(PubInfo)>
		
		<cfset FeeAmount = PubInfo.getPaymentFee()>
		
		<cfhttp url="#PostURL#" method="post">
			<!--- billing info --->
			<cfhttpparam type="formfield" name="Streetaddress" value="#Arguments.Address1#">
			<cfhttpparam type="formfield" name="Streetaddress2" value="#Arguments.Address2#">
			<cfhttpparam type="formfield" name="City" value="#Arguments.City#">
			<cfhttpparam type="formfield" name="State" value="#Arguments.State#">
			<cfhttpparam type="formfield" name="Zipcode" value="#Arguments.ZipCode#">
			
			<!--- cc info --->
			<cfhttpparam type="formfield" name="sjname" value="#Arguments.CardName#">
			<cfhttpparam type="formfield" name="type" value="#Arguments.CardType#">
			<cfhttpparam type="formfield" name="Month" value="#Arguments.CardExpireMonth#">
			<cfhttpparam type="formfield" name="Year" value="#Arguments.CardExpireYear#">
			<cfhttpparam type="formfield" name="Accountnumber" value="#Arguments.CardNumber#">
			
			<!--- shipping info 
			<cfhttpparam type="formfield" name="Shiptoname" value="#Session.Person.getFirstName()# #Session.Person.getLastName()#">
			<cfhttpparam type="formfield" name="Shiptostreetaddress" value="#Arguments.Address1#">
			<cfhttpparam type="formfield" name="Shiptostreetaddress2" value="#Arguments.Address2#">
			<cfhttpparam type="formfield" name="Shiptocity" value="#Arguments.City#">
			<cfhttpparam type="formfield" name="Shiptostate" value="#Arguments.State#">
			<cfhttpparam type="formfield" name="Shiptocountry" value="#Arguments.Country#">
			<cfhttpparam type="formfield" name="Shiptozipcode" value="#Arguments.ZipCode#">--->
			<cfhttpparam type="formfield" name="Shiptophone" value="#Arguments.Phone#">
			<cfhttpparam type="formfield" name="Email" value="#Session.Person.getEmail()#">
			
			<!--- skip jack --->
			<cfhttpparam type="formfield" name="Serialnumber" value="#SerialNumber#">
			
			<!--- order details --->
			<cfhttpparam type="formfield" name="Ordernumber" value="#Arguments.AttendeeID#"> 
			<cfhttpparam type="formfield" name="Transactionamount" value="#DecimalFormat(Trim(FeeAmount))#">
			<cfhttpparam type="formfield" name="Orderstring" value="#Activity.getActivityID()#~#Left(StripAllBut(Activity.getTitle(),'abcdefghijklmnopqrstuvwxyz0123456789 ',false),100)#~#FeeAmount#~1~N~||">
			
		</cfhttp>
        	
        <cfset isSuccess = ParseReturn(CFHTTP.FileContent)>
		
		<cfif isSuccess>
			<cfset Status = true>
		<cfelse>
			<cfset Status = false>
		</cfif>
            
		<cfreturn Status />
	</cffunction>
    
    <cffunction name="ParseReturn" access="private" output="yes" returntype="string">
		<cfargument name="ResponseText" type="string" required="yes" />
		
       <!----check what skipjack says & kick the user out of that is the case---->
			<cfparam name="form.szIsApproved" default="">
			<cfparam name="form.szTransactionFileName" default="">
			<!---<cfoutput>#CFHTTP.FileContent# #form.szIsApproved#</cfoutput>--->
			<!---<!--AUTHCODE=EMPTY--><!--szSerialNumber=000040232808--><!--szTransactionAmount=100--><!--szAuthorizationDeclinedMessage=--><!--szAVSResponseCode=--><!--szAVSResponseMessage=--><!--szOrderNumber=06012009033943--><!--szAuthorizationResponseCode=--><!--szIsApproved=0--><!--szCVV2ResponseCode=--><!--szCVV2ResponseMessage=--><!--szReturnCode=-97--><!--szTransactionFileName=--><!--szCAVVResponseCode=-->--->
			<cfset ValList="-AUTHCODE,-szSerialNumber,-szTransactionAmount,-szAuthorizationDeclinedMessage,-szAVSResponseCode,-szAVSResponseMessage,-szOrderNumber,-szAuthorizationResponseCode,-szReturnCode">
			<cfset VarList="strAuthCode,strSerialNumber,strTransactionAmount,strAuthorizationDeclinedMessage,strAVSResponseCode,strAVSResponseMessage,strOrderNumber,strAuthorizationResponseCode,strReturnCode">
			
			<cfset loopcount = 0>
			<cfloop list="#ValList#" index="Val_Name">
				<cfset loopcount = incrementvalue(loopcount)>
				<cfset length = Len(Val_Name)>
				<cfset start = FindNoCase(Val_Name, ResponseText, 1)+length+1>
				<cfset end = FindNoCase("-->", ResponseText, start)-start>
				<cfset Var_Name = #ListGetAt(VarList, loopcount, ",")#>
				<cfset a = #SetVariable(Var_name, "#Mid(CFHTTP.FileContent, start, end)#")#>
				<!---<cfoutput>#Var_Name#: #a#<br /></cfoutput>--->
			</cfloop>
			
			<cfif Len(#strAUTHORIZATIONRESPONSECODE#) EQ '6' AND #strRETURNCODE# EQ '1'> 
				<cfset CC_OK = true>
			<cfelse>
				<cfset CC_OK = false>
			</cfif>
		
		<cfreturn CC_OK />
	</cffunction>
	
	<cfscript>
		function stripAllBut(str,strip) {
			var badList = "\";
			var okList = "\\";
			var bCS = true;
		
			if(arrayLen(arguments) gte 3) bCS = arguments[3];
		
			strip = replaceList(strip,badList,okList);
			
			if(bCS) return rereplace(str,"[^#strip#]","","all");
			else return rereplaceNoCase(str,"[^#strip#]","","all");
		}
	</cfscript>
</cfcomponent>