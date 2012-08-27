/*! app/collections/activity_finfees
* 	@requires: app,app/collection,app/models/activity_finfee
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_finfees
*/
define("app/collections/activity_finfees",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Activity_finfeeModel = require("app/models/activity_finfee");
	
	Activity_finfees = AppCollection.extend({
		url: '/activity_finfees/',
		model: Activity_finfeeModel
	});

	module.setExports(Activity_finfees);
});
