#! ce._core.collections.Sys_activityrole.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Sys_activityrole.coffee = Backbone.Collection.extend
		url: '/sys_activityrole.coffee/',
		model: models.Sys_activityrole.coffee
,ce._core.models
