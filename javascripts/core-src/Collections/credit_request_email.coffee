#! ce._core.collections.Credit_request_email.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Credit_request_email.coffee = Backbone.Collection.extend
		url: '/credit_request_email.coffee/',
		model: models.Credit_request_email.coffee
,ce._core.models
