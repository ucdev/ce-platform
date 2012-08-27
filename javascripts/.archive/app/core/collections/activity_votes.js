/*! app/collections/activity_votes
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_votes
*/
define("app/collections/activity_votes",function(require,app) {
	var Activity_voteModel = require("app/models/activity_vote");

	app.collections.Activity_votes = app.Collection.extend({
		url: '/activity_votes/',
		model: Activity_voteModel
	});

	exports.app = app;
});
