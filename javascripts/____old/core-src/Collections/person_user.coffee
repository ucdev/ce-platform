#! ce._core.collections.Person_user.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Person_user.coffee = Backbone.Collection.extend
		url: '/person_user.coffee/',
		model: models.Person_user.coffee
,ce._core.models
