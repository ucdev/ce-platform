#! ce._core.collections.Activity_committee.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Activity_committee.coffee = Backbone.Collection.extend
		url: '/activity_committee.coffee/',
		model: models.Activity_committee.coffee
,ce._core.models
