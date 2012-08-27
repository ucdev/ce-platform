/*! app/collections/activity_votes
* 	@requires: app,app/models/activity_vote
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_votes
*/
define("app/collections/activity_votes",["require","app","app/models"],function(require,app) {
	var Activity_voteModel = require("app/models/activity_vote");

	var Activity_votes = app.Collection.extend({
		url: '/activity_votes/',
		model: Activity_voteModel
	});

	module.setExports(Activity_votes);
});
