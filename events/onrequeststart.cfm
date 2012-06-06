<!--- Place code here that should be executed on the "onRequestStart" event. --->
<cfset request.signup_from_email_address = "no-reply@uc.edu">

<cfparam name="params.key" default="0" />
<cfparam name="params.action" default="" />
<cfparam name="params.controller" default="" />
<cfset request['myself'] = urlFor(controller=params.controller,action=params.action,key=params.key) />