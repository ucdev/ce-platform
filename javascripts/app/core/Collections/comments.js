/*! app/core/collections/Comments */
define("app/core/collections/Comments",function() {
	var Comments = Backbone.Collection.extend({
			url: '/comments/',
			model: models.Comment
		});

	exports.Comments = Comments;
});
