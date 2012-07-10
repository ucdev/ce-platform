<!---
	Here you can add routes to your application and edit the default one.
	The default route is the one that will be called on your application's "home" page.
--->
<cfscript>
drawRoutes()
	// api
	.scope("api")
		.resources("credit_requests")
	.end()
	
	.match(name="login", pattern="login", controller="sessions", action="new")
	.match(name="logout", pattern="logout", controller="sessions", action="destroy")
	.match(name="signup", pattern="signup", controller="people", action="register")
	.match(name="activate", pattern="activation/[activationCode]", controller="activations", action="activate")
	.match(name="creditinator", pattern="code", controller="creditinator", action="start")
	
    // administration side
    .namespace("admin")
        .controller("blog")
            .get("new")
            .post("create")
            .get(name="show", pattern="show/[key]")
            .get(name="edit", pattern="edit/[key]")
            .put(name="update", pattern="update/[key]")
            .delete(name="delete", pattern="delete/[key]")
            .root(action="index")
        .end()
    .end()

    // public side
    .controller("blog")
        .get(name="show", pattern="[key]")
        .root(action="index")
    .end()

    // default routes
    .wildcard()
    .root(to="main##home")
.end();
</cfscript>