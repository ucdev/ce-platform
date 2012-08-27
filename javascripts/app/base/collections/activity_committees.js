/*! app/collections/activity_committees
* 	@requires: app,app/collection,app/models/activity_committee
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_committees
*/
define("app/collections/activity_committees",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Activity_committeeModel = require("app/models/activity_committee");
	
	Activity_committees = AppCollection.extend({
		url: '/activity_committees/',
		model: Activity_committeeModel
	});

	module.setExports(Activity_committees);
});
