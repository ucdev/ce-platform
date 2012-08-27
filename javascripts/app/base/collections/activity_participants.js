/*! app/collections/activity_participants
* 	@requires: app,app/collection,app/models/activity_participant
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_participants
*/
define("app/collections/activity_participants",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Activity_participantModel = require("app/models/activity_participant");
	
	Activity_participants = AppCollection.extend({
		url: '/activity_participants/',
		model: Activity_participantModel
	});

	module.setExports(Activity_participants);
});
