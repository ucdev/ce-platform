#! ce._core.collections.Sys_degree.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Sys_degree.coffee = Backbone.Collection.extend
		url: '/sys_degree.coffee/',
		model: models.Sys_degree.coffee
,ce._core.models
