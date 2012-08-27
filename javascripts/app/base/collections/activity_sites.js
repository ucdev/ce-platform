/*! app/collections/activity_sites
* 	@requires: app,app/collection,app/models/activity_site
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_sites
*/
define("app/collections/activity_sites",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Activity_siteModel = require("app/models/activity_site");
	
	Activity_sites = AppCollection.extend({
		url: '/activity_sites/',
		model: Activity_siteModel
	});

	module.setExports(Activity_sites);
});
