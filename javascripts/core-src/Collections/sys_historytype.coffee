#! ce._core.collections.Sys_historytype.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Sys_historytype.coffee = Backbone.Collection.extend
		url: '/sys_historytype.coffee/',
		model: models.Sys_historytype.coffee
,ce._core.models
