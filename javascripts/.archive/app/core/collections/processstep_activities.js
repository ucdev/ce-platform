/*! app/collections/processstep_activities
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Processstep_activities
*/
define("app/collections/processstep_activities",function(require,app) {
	var Processstep_activityModel = require("app/models/processstep_activity");

	app.collections.Processstep_activities = app.Collection.extend({
		url: '/processstep_activities/',
		model: Processstep_activityModel
	});

	exports.app = app;
});
