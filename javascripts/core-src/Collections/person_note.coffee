#! ce._core.collections.Person_note.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Person_note.coffee = Backbone.Collection.extend
		url: '/person_note.coffee/',
		model: models.Person_note.coffee
,ce._core.models
