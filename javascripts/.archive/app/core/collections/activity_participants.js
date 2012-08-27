/*! app/collections/activity_participants
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_participants
*/
define("app/collections/activity_participants",function(require,app) {
	var Activity_participantModel = require("app/models/activity_participant");

	app.collections.Activity_participants = app.Collection.extend({
		url: '/activity_participants/',
		model: Activity_participantModel
	});

	exports.app = app;
});
