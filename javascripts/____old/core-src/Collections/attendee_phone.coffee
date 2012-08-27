#! ce._core.collections.Attendee_phone.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Attendee_phone.coffee = Backbone.Collection.extend
		url: '/attendee_phone.coffee/',
		model: models.Attendee_phone.coffee
,ce._core.models
