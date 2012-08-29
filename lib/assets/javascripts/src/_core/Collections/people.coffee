#! ce._core.collections.People extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.People = Backbone.Collection.extend
		url: '/people/',
		model: models.Person
,ce._core.models
