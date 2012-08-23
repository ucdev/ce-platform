#! ce._core.collections.Person_client.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Person_client.coffee = Backbone.Collection.extend
		url: '/person_client.coffee/',
		model: models.Person_client.coffee
,ce._core.models
