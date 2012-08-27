#! ce._core.collections.Person_pref.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Person_pref.coffee = Backbone.Collection.extend
		url: '/person_pref.coffee/',
		model: models.Person_pref.coffee
,ce._core.models
