#! ce._core.Collections.People extends Backbone.Collection */
ce.module "_core.Collections", (self, ce, Backbone, Marionette, $, _) ->
	self.People = Backbone.Collection.extend
		url: '/people/',
		model: ce.Models.Person
