<!---
	Here you can add routes to your application and edit the default one.
	The default route is the one that will be called on your application's "home" page.
--->
<cfscript>
drawRoutes()
	.match(name="assets",pattern="assets/[key].[format]",action="sprockets")
	.match(name="tmpls",pattern="tmpls/get",controller="tmpls",action="get")
	// ACTIVITY SECTION
	.scope(name="activity",path="activities/[activityId]/")
		.resources("credit_requests")
		.match(name="participants",pattern="participants",controller="activity_participants",action="index")
		.match(name="credits",pattern="credits",controller="activity_credits",action="index")
		.resources("activity_accme")
		.resources("activity_faculties")
		.resources("activity_committees")
		.resources("activity_documents")
		.resources("activity_finances")
		.resources("activity_cdc")
	.end()
	
	.resources("activities")
	.match(name="messagesInbox",pattern="messages/inbox",controller="messages",action="inbox")
	
	.scope(name="tmpl",path="tmpl")
		.resources("credit_requests")
		.resources("activity_participants")
		.resources("activities")
		.resources("people")
	.end()
	
	.resources("credit_requests")
	.resources("activity_participants")
	.resources("activities")
	.resources("people")
	
	// api
	.namespace("api")
		.resources("activity_participants")
	.end()
	
	.match(name="home", pattern="", controller="main", action="home")
	.match(name="login", pattern="login", controller="sessions", action="new")
	.match(name="logout", pattern="logout", controller="sessions", action="destroy")
	.match(name="signup", pattern="signup", controller="people", action="register")
	.match(name="activate", pattern="activation/[activationCode]", controller="activations", action="activate")
	.match(name="creditinator", pattern="code", controller="creditinator", action="start")

	.match(name="assetSprites",pattern="assets/[action]",controller="assets")
    // default routes
    .wildcard()
    .root(to="main##home")
.end();
</cfscript>