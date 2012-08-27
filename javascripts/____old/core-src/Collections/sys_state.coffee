#! ce._core.collections.Sys_state.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Sys_state.coffee = Backbone.Collection.extend
		url: '/sys_state.coffee/',
		model: models.Sys_state.coffee
,ce._core.models
