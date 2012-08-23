#! ce._core.collections.Sys_activitytype.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Sys_activitytype.coffee = Backbone.Collection.extend
		url: '/sys_activitytype.coffee/',
		model: models.Sys_activitytype.coffee
,ce._core.models
