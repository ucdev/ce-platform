/*! app/collections/comments
* 	@requires: app,app/collection,app/models/comment
* 	@extends: app.Collection
* 	@exports: app.collections.Comments
*/
define("app/collections/comments",["require"],function(require) {
	var AppCollection = require("app/collection");
	var CommentModel = require("app/models/comment");
	
	Comments = AppCollection.extend({
		url: '/comments/',
		model: CommentModel
	});

	module.setExports(Comments);
});
