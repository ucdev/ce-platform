#! ce._core.collections.Certificate.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Certificate.coffee = Backbone.Collection.extend
		url: '/certificate.coffee/',
		model: models.Certificate.coffee
,ce._core.models
