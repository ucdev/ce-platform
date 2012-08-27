#! ce._core.collections.Assessment.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Assessment.coffee = Backbone.Collection.extend
		url: '/assessment.coffee/',
		model: models.Assessment.coffee
,ce._core.models
