#! ce._core.collections.Activity_publish.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Activity_publish.coffee = Backbone.Collection.extend
		url: '/activity_publish.coffee/',
		model: models.Activity_publish.coffee
,ce._core.models
