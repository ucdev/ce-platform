#! ce._core.collections.Sys_projecttype.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Sys_projecttype.coffee = Backbone.Collection.extend
		url: '/sys_projecttype.coffee/',
		model: models.Sys_projecttype.coffee
,ce._core.models
