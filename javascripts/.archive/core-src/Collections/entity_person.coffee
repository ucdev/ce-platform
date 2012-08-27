#! ce._core.collections.Entity_person.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Entity_person.coffee = Backbone.Collection.extend
		url: '/entity_person.coffee/',
		model: models.Entity_person.coffee
,ce._core.models
