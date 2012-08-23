#! ce._core.collections.Person_degree.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Person_degree.coffee = Backbone.Collection.extend
		url: '/person_degree.coffee/',
		model: models.Person_degree.coffee
,ce._core.models
