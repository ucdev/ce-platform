#! ce._core.collections.Attendee_component.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Attendee_component.coffee = Backbone.Collection.extend
		url: '/attendee_component.coffee/',
		model: models.Attendee_component.coffee
,ce._core.models
