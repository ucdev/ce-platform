#! ce._core.collections.Sys_credit.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Sys_credit.coffee = Backbone.Collection.extend
		url: '/sys_credit.coffee/',
		model: models.Sys_credit.coffee
,ce._core.models
