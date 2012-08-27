#! ce._core.collections.Sys_profc.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Sys_profc.coffee = Backbone.Collection.extend
		url: '/sys_profc.coffee/',
		model: models.Sys_profc.coffee
,ce._core.models
