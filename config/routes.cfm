<!---
	Here you can add routes to your application and edit the default one.
	The default route is the one that will be called on your application's "home" page.
--->
<cfscript>
drawRoutes()
	// api
	.scope(name="api",path="api")
		.resources("credit_requests")
		.wildcard()
	.end()
	
	.resources("credit_requests")
	.resources("activity_participants")
	.resources("activities")
	.resources("people")
	
	.match(name="login", pattern="login", controller="sessions", action="new")
	.match(name="logout", pattern="logout", controller="sessions", action="destroy")
	.match(name="signup", pattern="signup", controller="people", action="register")
	.match(name="activate", pattern="activation/[activationCode]", controller="activations", action="activate")
	.match(name="creditinator", pattern="code", controller="creditinator", action="start")

    // default routes
    .wildcard()
    .root(to="main##home")
.end();
</cfscript>