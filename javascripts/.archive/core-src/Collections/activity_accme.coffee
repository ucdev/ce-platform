#! ce._core.collections.Activity_accme.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Activity_accme.coffee = Backbone.Collection.extend
		url: '/activity_accme.coffee/',
		model: models.Activity_accme.coffee
,ce._core.models
