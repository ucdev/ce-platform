#! ce._core.collections.Cert_credit.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Cert_credit.coffee = Backbone.Collection.extend
		url: '/cert_credit.coffee/',
		model: models.Cert_credit.coffee
,ce._core.models
