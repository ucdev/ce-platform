#! ce._core.collections.Activity_step.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Activity_step.coffee = Backbone.Collection.extend
		url: '/activity_step.coffee/',
		model: models.Activity_step.coffee
,ce._core.models
