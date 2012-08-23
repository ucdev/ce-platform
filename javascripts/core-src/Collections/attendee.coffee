#! ce._core.collections.Attendee.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Attendee.coffee = Backbone.Collection.extend
		url: '/attendee.coffee/',
		model: models.Attendee.coffee
,ce._core.models
