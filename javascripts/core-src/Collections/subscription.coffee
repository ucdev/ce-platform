#! ce._core.collections.Subscription.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Subscription.coffee = Backbone.Collection.extend
		url: '/subscription.coffee/',
		model: models.Subscription.coffee
,ce._core.models
