#! ce._core.collections.Sys_assessresultstatus.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Sys_assessresultstatus.coffee = Backbone.Collection.extend
		url: '/sys_assessresultstatus.coffee/',
		model: models.Sys_assessresultstatus.coffee
,ce._core.models
