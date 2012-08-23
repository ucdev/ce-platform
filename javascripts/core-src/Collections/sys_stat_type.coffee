#! ce._core.collections.Sys_stat_type.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Sys_stat_type.coffee = Backbone.Collection.extend
		url: '/sys_stat_type.coffee/',
		model: models.Sys_stat_type.coffee
,ce._core.models
