/*! app/collections/activity_specialtylms
* 	@requires: app,app/collection,app/models/activity_specialtylm
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_specialtylms
*/
define("app/collections/activity_specialtylms",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Activity_specialtylmModel = require("app/models/activity_specialtylm");
	
	Activity_specialtylms = AppCollection.extend({
		url: '/activity_specialtylms/',
		model: Activity_specialtylmModel
	});

	module.setExports(Activity_specialtylms);
});
