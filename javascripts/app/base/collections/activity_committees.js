/*! app/collections/activity_committees
* 	@requires: app,app/models/activity_committee
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_committees
*/
define("app/collections/activity_committees",["require","app","app/models"],function(require,app) {
	var Activity_committeeModel = require("app/models/activity_committee");

	var Activity_committees = app.Collection.extend({
		url: '/activity_committees/',
		model: Activity_committeeModel
	});

	module.setExports(Activity_committees);
});
