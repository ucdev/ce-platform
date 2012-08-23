#! ce._core.collections.Sys_sitelms.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Sys_sitelms.coffee = Backbone.Collection.extend
		url: '/sys_sitelms.coffee/',
		model: models.Sys_sitelms.coffee
,ce._core.models
