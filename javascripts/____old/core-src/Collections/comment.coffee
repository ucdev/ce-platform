#! ce._core.collections.Comment.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Comment.coffee = Backbone.Collection.extend
		url: '/comment.coffee/',
		model: models.Comment.coffee
,ce._core.models
