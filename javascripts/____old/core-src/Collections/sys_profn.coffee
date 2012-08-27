#! ce._core.collections.Sys_profn.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Sys_profn.coffee = Backbone.Collection.extend
		url: '/sys_profn.coffee/',
		model: models.Sys_profn.coffee
,ce._core.models
