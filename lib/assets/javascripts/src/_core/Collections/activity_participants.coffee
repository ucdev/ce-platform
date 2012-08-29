#! ce._core.collections.Activity_participants extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Activity_participants = Backbone.Collection.extend
		url: '/activity_participants/loadData',
		model: models.Activity_participant
,ce._core.models
