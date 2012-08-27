/*! app/collections/activity_votes
* 	@requires: app,app/collection,app/models/activity_vote
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_votes
*/
define("app/collections/activity_votes",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Activity_voteModel = require("app/models/activity_vote");
	
	Activity_votes = AppCollection.extend({
		url: '/activity_votes/',
		model: Activity_voteModel
	});

	module.setExports(Activity_votes);
});
