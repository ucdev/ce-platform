/*! app/collections/activity_comments
* 	@requires: app,app/collection,app/models/activity_comment
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_comments
*/
define("app/collections/activity_comments",["require"],function(require) {
	var AppCollection = require("app/collection");
	var Activity_commentModel = require("app/models/activity_comment");
	
	Activity_comments = AppCollection.extend({
		url: '/activity_comments/',
		model: Activity_commentModel
	});

	module.setExports(Activity_comments);
});
