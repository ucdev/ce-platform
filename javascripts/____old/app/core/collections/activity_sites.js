/*! app/collections/activity_sites
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_sites
*/
define("app/collections/activity_sites",function(require,app) {
	var Activity_siteModel = require("app/models/activity_site");

	app.collections.Activity_sites = app.Collection.extend({
		url: '/activity_sites/',
		model: Activity_siteModel
	});

	exports.app = app;
});
