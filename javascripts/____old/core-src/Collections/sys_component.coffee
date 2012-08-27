#! ce._core.collections.Sys_component.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Sys_component.coffee = Backbone.Collection.extend
		url: '/sys_component.coffee/',
		model: models.Sys_component.coffee
,ce._core.models
