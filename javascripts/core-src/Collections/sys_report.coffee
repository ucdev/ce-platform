#! ce._core.collections.Sys_report.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Sys_report.coffee = Backbone.Collection.extend
		url: '/sys_report.coffee/',
		model: models.Sys_report.coffee
,ce._core.models
