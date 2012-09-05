#! ce._core.collections.Credit_requests extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Credit_requests = Backbone.Collection.extend
		url: '/credit_requests/',
		model: models.Credit_request
,ce._core.models
