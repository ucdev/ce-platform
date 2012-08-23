#! ce._core.collections.Sys_cbafund.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Sys_cbafund.coffee = Backbone.Collection.extend
		url: '/sys_cbafund.coffee/',
		model: models.Sys_cbafund.coffee
,ce._core.models
