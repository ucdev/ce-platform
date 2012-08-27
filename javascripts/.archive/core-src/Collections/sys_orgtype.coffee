#! ce._core.collections.Sys_orgtype.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Sys_orgtype.coffee = Backbone.Collection.extend
		url: '/sys_orgtype.coffee/',
		model: models.Sys_orgtype.coffee
,ce._core.models
