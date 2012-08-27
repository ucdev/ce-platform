#! ce._core.collections.Account.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Account.coffee = Backbone.Collection.extend
		url: '/account.coffee/',
		model: models.Account.coffee
,ce._core.models
