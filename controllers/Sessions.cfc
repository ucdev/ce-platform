<cfcomponent extends="controller">

	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->

	<cffunction name="init">
		<cfset filters(through="loginProhibited", only="new, create")>
	</cffunction>

	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->

	<cffunction name="new">
	</cffunction>

	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->

	<cffunction name="create">
		<cfif params.login is "" or params.password is "">
			<cfset flashInsert(error="Login failed, please try again")>
			<cfset redirectTo(action="new")>
		<cfelse>
			<cfset $passwordAuthentication(params.login, params.password) />
		</cfif>
	</cffunction>

	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->

	<cffunction name="destroy">
		<!--- todo: need to check for the remember me flag here and delete cookie if needed --->
		<cfset structDelete(session, 'currentUser') />
		<cfset flashInsert(success='You have been logged out') />
		<cfset redirectTo(route="home") />
	</cffunction>
	

	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->

	<!--- private methods --->

	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->

	<cffunction name="$passwordAuthentication">
		<cfargument name="login" type="any" />
		<cfargument name="password" type="any" />
		
		<cfset authEmail = model("personemail").findOneByEmail_Address(arguments.login)>
        
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

		<cfset session.currentUser = arguments.user>

		<cfif structKeyExists(params,"rememberMe")>
			<cfcookie name="app.rememberme" value="true" expires="14" />
		</cfif>

		<!--- Update the lastLogin column --->
		<cfset session.currentUser.lastLogin = now()>
		<cfset session.currentUser.save()>

		<!--- This redirects the user to the default account page but you can change this to go where you want --->
		<cfset flashInsert(success="Hello <strong>#session.currentUser.firstName#</strong>! You are now signed in.")>
		<cfset redirectTo(route="home")>
	</cffunction>

	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->

	<cffunction name="$failedLogin">
		<!---
			TODO : would like to add a method call here to update a failed login table...
		--->
		<cfset flashInsert(error="Login failed, please try again!")>
		<cfset redirectTo(action="new")>
	</cffunction>

	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->

</cfcomponent>

