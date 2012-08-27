#! ce._core.collections.Sys_funrc.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Sys_funrc.coffee = Backbone.Collection.extend
		url: '/sys_funrc.coffee/',
		model: models.Sys_funrc.coffee
,ce._core.models
