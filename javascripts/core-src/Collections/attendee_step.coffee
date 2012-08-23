#! ce._core.collections.Attendee_step.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Attendee_step.coffee = Backbone.Collection.extend
		url: '/attendee_step.coffee/',
		model: models.Attendee_step.coffee
,ce._core.models
