#! ce._core.collections.Sys_personstatus.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Sys_personstatus.coffee = Backbone.Collection.extend
		url: '/sys_personstatus.coffee/',
		model: models.Sys_personstatus.coffee
,ce._core.models
