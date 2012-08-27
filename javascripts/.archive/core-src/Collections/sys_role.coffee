#! ce._core.collections.Sys_role.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Sys_role.coffee = Backbone.Collection.extend
		url: '/sys_role.coffee/',
		model: models.Sys_role.coffee
,ce._core.models
