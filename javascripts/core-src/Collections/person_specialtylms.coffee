#! ce._core.collections.Person_specialtylms.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Person_specialtylms.coffee = Backbone.Collection.extend
		url: '/person_specialtylms.coffee/',
		model: models.Person_specialtylms.coffee
,ce._core.models
