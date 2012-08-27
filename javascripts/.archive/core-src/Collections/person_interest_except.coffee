#! ce._core.collections.Person_interest_except.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Person_interest_except.coffee = Backbone.Collection.extend
		url: '/person_interest_except.coffee/',
		model: models.Person_interest_except.coffee
,ce._core.models
