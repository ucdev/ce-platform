/*! app/collections/activity_participants
* 	@requires: app,app/models/activity_participant
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_participants
*/
define("app/collections/activity_participants",["require","app","app/models"],function(require,app) {
	var Activity_participantModel = require("app/models/activity_participant");

	var Activity_participants = app.Collection.extend({
		url: '/activity_participants/',
		model: Activity_participantModel
	});

	module.setExports(Activity_participants);
});
