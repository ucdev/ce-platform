#! ce._core.collections.Sys_supporter.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Sys_supporter.coffee = Backbone.Collection.extend
		url: '/sys_supporter.coffee/',
		model: models.Sys_supporter.coffee
,ce._core.models
