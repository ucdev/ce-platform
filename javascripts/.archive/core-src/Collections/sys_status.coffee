#! ce._core.collections.Sys_status.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Sys_status.coffee = Backbone.Collection.extend
		url: '/sys_status.coffee/',
		model: models.Sys_status.coffee
,ce._core.models
