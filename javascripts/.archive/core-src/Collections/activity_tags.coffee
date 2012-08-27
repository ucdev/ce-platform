#! ce._core.collections.Activity_tags.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Activity_tags.coffee = Backbone.Collection.extend
		url: '/activity_tags.coffee/',
		model: models.Activity_tags.coffee
,ce._core.models
