/*! app/collections/activity_sites
* 	@requires: app,app/models/activity_site
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_sites
*/
define("app/collections/activity_sites",["require","app","app/models"],function(require,app) {
	var Activity_siteModel = require("app/models/activity_site");

	var Activity_sites = app.Collection.extend({
		url: '/activity_sites/',
		model: Activity_siteModel
	});

	module.setExports(Activity_sites);
});
