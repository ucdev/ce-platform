#! ce._core.collections.Activity_participant.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Activity_participant.coffee = Backbone.Collection.extend
		url: '/activity_participant.coffee/',
		model: models.Activity_participant.coffee
,ce._core.models
