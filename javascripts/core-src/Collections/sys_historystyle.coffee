#! ce._core.collections.Sys_historystyle.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Sys_historystyle.coffee = Backbone.Collection.extend
		url: '/sys_historystyle.coffee/',
		model: models.Sys_historystyle.coffee
,ce._core.models
