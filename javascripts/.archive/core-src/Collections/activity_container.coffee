#! ce._core.collections.Activity_container.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Activity_container.coffee = Backbone.Collection.extend
		url: '/activity_container.coffee/',
		model: models.Activity_container.coffee
,ce._core.models
