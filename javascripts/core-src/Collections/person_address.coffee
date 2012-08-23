#! ce._core.collections.Person_address.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Person_address.coffee = Backbone.Collection.extend
		url: '/person_address.coffee/',
		model: models.Person_address.coffee
,ce._core.models
