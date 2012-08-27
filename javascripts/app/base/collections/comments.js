/*! app/collections/comments
* 	@requires: app,app/models/comment
* 	@extends: app.Collection
* 	@exports: app.collections.Comments
*/
define("app/collections/comments",["require","app","app/models"],function(require,app) {
	var CommentModel = require("app/models/comment");

	var Comments = app.Collection.extend({
		url: '/comments/',
		model: CommentModel
	});

	module.setExports(Comments);
});
