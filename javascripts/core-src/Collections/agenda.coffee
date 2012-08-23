#! ce._core.collections.Agenda.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Agenda.coffee = Backbone.Collection.extend
		url: '/agenda.coffee/',
		model: models.Agenda.coffee
,ce._core.models
