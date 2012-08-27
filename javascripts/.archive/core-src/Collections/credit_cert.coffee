#! ce._core.collections.Credit_cert.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Credit_cert.coffee = Backbone.Collection.extend
		url: '/credit_cert.coffee/',
		model: models.Credit_cert.coffee
,ce._core.models
