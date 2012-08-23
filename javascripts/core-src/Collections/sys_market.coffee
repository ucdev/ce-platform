#! ce._core.collections.Sys_market.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Sys_market.coffee = Backbone.Collection.extend
		url: '/sys_market.coffee/',
		model: models.Sys_market.coffee
,ce._core.models
