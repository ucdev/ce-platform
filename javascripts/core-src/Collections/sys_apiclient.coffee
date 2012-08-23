#! ce._core.collections.Sys_apiclient.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Sys_apiclient.coffee = Backbone.Collection.extend
		url: '/sys_apiclient.coffee/',
		model: models.Sys_apiclient.coffee
,ce._core.models
