#! ce._core.collections.Attendee_address.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Attendee_address.coffee = Backbone.Collection.extend
		url: '/attendee_address.coffee/',
		model: models.Attendee_address.coffee
,ce._core.models
