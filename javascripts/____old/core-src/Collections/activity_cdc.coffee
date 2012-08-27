#! ce._core.collections.Activity_cdc.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Activity_cdc.coffee = Backbone.Collection.extend
		url: '/activity_cdc.coffee/',
		model: models.Activity_cdc.coffee
,ce._core.models
