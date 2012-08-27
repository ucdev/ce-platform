/*! app/collections/activity_committees
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_committees
*/
define("app/collections/activity_committees",function(require,app) {
	var Activity_committeeModel = require("app/models/activity_committee");

	app.collections.Activity_committees = app.Collection.extend({
		url: '/activity_committees/',
		model: Activity_committeeModel
	});

	exports.app = app;
});
