#! ce._core.collections.Twilio_log.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Twilio_log.coffee = Backbone.Collection.extend
		url: '/twilio_log.coffee/',
		model: models.Twilio_log.coffee
,ce._core.models
