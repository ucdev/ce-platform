#! ce.Collections.People extends Backbone.Collection */
ce.module "Collections", (self, ce, Backbone, Marionette, $, _) ->
	self.People = Backbone.Collection.extend
		url: '/people/',
		model: ce.Models.Person
