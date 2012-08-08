<cfcomponent extends="controller">

	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->

	<cffunction name="init">
		<cfset filters(through="loginProhibited", only="new, create")>
		<cfset super.init() />
	</cffunction>

	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->

	<cffunction name="new">
	</cffunction>
	
	<cffunction name="status">
		<cfset response = createObject("lib.buildStruct").init(status=false,statusMsg="no_status") />
		
		<cfif isLoggedIn()>
			<cfset response.setStatus(true) />
			<cfset response.setStatusMsg("logged_in") />
		<cfelse>
			<cfset response.setStatus(false) />
			<cfset response.setStatusMsg("logged_out") />
		</cfif>
		
		<cfcontent type="text/javascript" />
		<cfset renderText(response.getJson()) />
	</cffunction>

	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->

	<cffunction name="create">
		<cfset returnVar = createObject("component","lib.buildStruct").init(status=false,statusMsg="login_failed") />

		<cfif params.login is "" or params.password is "">
			<cfif NOT isAjax()>
				<cfset flashInsert(error="Login failed, please try again")>
				<cfset redirectTo(action="new")>
			</cfif>
		<cfelse>
			<cfset $passwordAuthentication(params.login, params.password) />
		</cfif>

		<cfcontent type="text/javascript" />
		<cfset renderText(returnVar.getJson()) />
	</cffunction>

	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->

	<cffunction name="destroy">
		<!--- todo: need to check for the remember me flag here and delete cookie if needed --->
		<cfset structDelete(session, 'currentUser') />
		<cfset structDelete(session, 'account') />
		<cfset flashInsert(success='You have been logged out') />
		<cfset redirectTo(route="home") />
	</cffunction>
	

	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->

	<!--- private methods --->

	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->

	<cffunction name="$passwordAuthentication">
		<cfargument name="login" type="any" />
		<cfargument name="password" type="any" />
		
		<cfset authEmail = model("person_email").findOneByEmail_Address(arguments.login)>
        
		<cfif isboolean(authEmail) and Not authEmail and authEmail.isLogginable()>
			<cfset $failedLogin()>
		</cfif>
        
        <cfset authUser = model("person").findByKey(authEmail.person_id)>
        
		<cfif isboolean(authUser) and Not authUser>
			<cfset $failedLogin()>
        </cfif>
        
		<cfif authUser.isPassword(arguments.password) AND authUser.isActive()>
			<cfset $successfulLogin(authUser)>
		<cfelse>
			<cfset $failedLogin()>
		</cfif>
	</cffunction>

	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->

	<cffunction name="$successfulLogin">
	 <cfargument name="user" type="any">

		<cfset session['currentUser'] = arguments.user>
		<cfset session['account'] = model("account").findOneByPersonid(arguments.user.id)>

		<cfif structKeyExists(params,"rememberMe")>
			<cfcookie name="app.rememberme" value="true" expires="14" />
		</cfif>

		<!--- Update the lastLogin column --->
		<cfset session.currentUser.lastLogin = now()>
		<cfset session.currentUser.save()>

		<cfset setUserInfo() />

		<cfset returnVar.setStatus(true) />
		<cfset returnVar.setStatusMsg("logged_in") />
		<cfset returnVar.setPayload(userInfo) />
		<cfif NOT isAjax()>
			<!--- This redirects the user to the default account page but you can change this to go where you want --->
			<cfset flashInsert(success="Hello <strong>#session.currentUser.firstName#</strong>! You are now signed in.")>
			<cfset redirectTo(route="home")>
		</cfif>
	</cffunction>

	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->

	<cffunction name="$failedLogin">
		<!---
			TODO : would like to add a method call here to update a failed login table...
		--->
		<cfset returnVar.setStatus(false) />
		<cfset returnVar.setStatusMsg("login_failed") />

		<cfif NOT isAjax()>
			<cfset flashInsert(error="Login failed, please try again!")>
			<cfset redirectTo(action="new")>
		</cfif>
	</cffunction>

	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->

</cfcomponent>

