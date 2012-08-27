#! ce._core.collections.Sys_grouping.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Sys_grouping.coffee = Backbone.Collection.extend
		url: '/sys_grouping.coffee/',
		model: models.Sys_grouping.coffee
,ce._core.models
