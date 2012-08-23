#! ce._core.collections.Sys_stepstatus.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Sys_stepstatus.coffee = Backbone.Collection.extend
		url: '/sys_stepstatus.coffee/',
		model: models.Sys_stepstatus.coffee
,ce._core.models
