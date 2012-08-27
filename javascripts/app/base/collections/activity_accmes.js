/*! app/collections/activity_accmes
* 	@requires: app,app/collection,app/models/activity_accme
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_accmes
*/
define("app/collections/activity_accmes",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Activity_accmeModel = require("app/models/activity_accme");
	
	Activity_accmes = AppCollection.extend({
		url: '/activity_accmes/',
		model: Activity_accmeModel
	});

	module.setExports(Activity_accmes);
});
