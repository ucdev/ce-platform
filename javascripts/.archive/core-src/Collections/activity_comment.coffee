#! ce._core.collections.Activity_comment.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Activity_comment.coffee = Backbone.Collection.extend
		url: '/activity_comment.coffee/',
		model: models.Activity_comment.coffee
,ce._core.models
