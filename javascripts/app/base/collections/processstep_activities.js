/*! app/collections/processstep_activities
* 	@requires: app,app/models/processstep_activity
* 	@extends: app.Collection
* 	@exports: app.collections.Processstep_activities
*/
define("app/collections/processstep_activities",["require","app","app/models"],function(require,app) {
	var Processstep_activityModel = require("app/models/processstep_activity");

	var Processstep_activities = app.Collection.extend({
		url: '/processstep_activities/',
		model: Processstep_activityModel
	});

	module.setExports(Processstep_activities);
});
