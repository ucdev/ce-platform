#! ce._core.collections.Cert.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Cert.coffee = Backbone.Collection.extend
		url: '/cert.coffee/',
		model: models.Cert.coffee
,ce._core.models
