#! ce._core.collections.Activity_vote.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Activity_vote.coffee = Backbone.Collection.extend
		url: '/activity_vote.coffee/',
		model: models.Activity_vote.coffee
,ce._core.models
