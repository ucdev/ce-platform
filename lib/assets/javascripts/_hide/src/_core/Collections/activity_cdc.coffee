#! ce._core.collections.Activity_cdc extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Activity_cdc = Backbone.Collection.extend
		url: '/activity_cdc/',
		model: models.Activity_cdc
,ce._core.models
