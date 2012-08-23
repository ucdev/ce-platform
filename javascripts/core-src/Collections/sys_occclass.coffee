#! ce._core.collections.Sys_occclass.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Sys_occclass.coffee = Backbone.Collection.extend
		url: '/sys_occclass.coffee/',
		model: models.Sys_occclass.coffee
,ce._core.models
