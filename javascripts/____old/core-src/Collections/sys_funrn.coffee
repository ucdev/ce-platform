#! ce._core.collections.Sys_funrn.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Sys_funrn.coffee = Backbone.Collection.extend
		url: '/sys_funrn.coffee/',
		model: models.Sys_funrn.coffee
,ce._core.models
