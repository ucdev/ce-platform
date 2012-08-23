#! ce._core.collections.Credit_request_import.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Credit_request_import.coffee = Backbone.Collection.extend
		url: '/credit_request_import.coffee/',
		model: models.Credit_request_import.coffee
,ce._core.models
