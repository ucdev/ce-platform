#! ce._core.collections.Sys_activitysteptype.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Sys_activitysteptype.coffee = Backbone.Collection.extend
		url: '/sys_activitysteptype.coffee/',
		model: models.Sys_activitysteptype.coffee
,ce._core.models
