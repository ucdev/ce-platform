#! ce._core.collections.Credit_request.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Credit_request.coffee = Backbone.Collection.extend
		url: '/credit_request.coffee/',
		model: models.Credit_request.coffee
,ce._core.models
