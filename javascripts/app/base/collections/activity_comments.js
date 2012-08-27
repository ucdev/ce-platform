/*! app/collections/activity_comments
* 	@requires: app,app/models/activity_comment
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_comments
*/
define("app/collections/activity_comments",["require","app","app/models"],function(require,app) {
	var Activity_commentModel = require("app/models/activity_comment");

	var Activity_comments = app.Collection.extend({
		url: '/activity_comments/',
		model: Activity_commentModel
	});

	module.setExports(Activity_comments);
});
