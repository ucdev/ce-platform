#! ce._core.collections.Sys_prinemp.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Sys_prinemp.coffee = Backbone.Collection.extend
		url: '/sys_prinemp.coffee/',
		model: models.Sys_prinemp.coffee
,ce._core.models
