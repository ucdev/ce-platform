/*! app/collections/comments
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Comments
*/
define("app/collections/comments",function(require,app) {
	var CommentModel = require("app/models/comment");

	app.collections.Comments = app.Collection.extend({
		url: '/comments/',
		model: CommentModel
	});

	exports.app = app;
});
