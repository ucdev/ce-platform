#Continuing Education Platform
This is a continuing education platform we are currently developing specifically for CME but could be used for other CE too.
It is a "facebook-esque" interface where the management and the learning experience is done through the same general UI.
We say facebook-esque because each "course" and each "person" has a "page" that has an edit mode but all pages are structured identically so the entire user experience is comfortable.

##Technologies
* HTML5 / CSS3
* JavaScript
	- Backbone.js (Structure: Models, Views, Collections, etc.)
	- Inject.js (AMD / CommonJS compliant dependency management awesomeness)
	- Unobtrusive PushState for most navigation functions but falls back to regular links that do render properly on learner pages.
	- Modular Development

##Server
* Railo Open Source CFML Engine (ColdFusion)
* CFWheels (a rails inspired CFML framework for rapid development)
* RESTful API
* oAuth2 SSO (Sign-in with <ce_platform>)

##Database
* SQL Server 2005 :-/
* Currently uses our previously designed database we've used for many years.
* Our database creation is done through DBMigrate now so we should be able to port it to MySQL or something else quite easily with adapters.