#! ce._core.collections.Sys_cbofund.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Sys_cbofund.coffee = Backbone.Collection.extend
		url: '/sys_cbofund.coffee/',
		model: models.Sys_cbofund.coffee
,ce._core.models
