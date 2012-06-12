<!---
	Here you can add routes to your application and edit the default one.
	The default route is the one that will be called on your application's "home" page.
--->
<cfset addRoute(name="home", pattern="", controller="main", action="home")>
<cfset addRoute(name="login", pattern="login", controller="sessions", action="new")>
<cfset addRoute(name="logout", pattern="logout", controller="sessions", action="destroy")>
<cfset addRoute(name="signup", pattern="signup", controller="people", action="register")>
<cfset addRoute(name="activate", pattern="activation/[activationCode]", controller="activations", action="activate")>
<cfset addRoute(name="creditinator", pattern="code", controller="creditinator", action="start")>