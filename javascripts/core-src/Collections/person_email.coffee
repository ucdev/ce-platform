#! ce._core.collections.Person_email.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Person_email.coffee = Backbone.Collection.extend
		url: '/person_email.coffee/',
		model: models.Person_email.coffee
,ce._core.models
