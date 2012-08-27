#! ce._core.collections.Person.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Person.coffee = Backbone.Collection.extend
		url: '/person.coffee/',
		model: models.Person.coffee
,ce._core.models
