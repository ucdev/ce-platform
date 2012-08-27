#! ce._core.collections.Sys_subscriptiontype.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Sys_subscriptiontype.coffee = Backbone.Collection.extend
		url: '/sys_subscriptiontype.coffee/',
		model: models.Sys_subscriptiontype.coffee
,ce._core.models
