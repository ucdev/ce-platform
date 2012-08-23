#! ce._core.collections.Person_file.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Person_file.coffee = Backbone.Collection.extend
		url: '/person_file.coffee/',
		model: models.Person_file.coffee
,ce._core.models
