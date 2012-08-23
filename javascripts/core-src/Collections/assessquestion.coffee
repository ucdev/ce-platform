#! ce._core.collections.Assessquestion.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Assessquestion.coffee = Backbone.Collection.extend
		url: '/assessquestion.coffee/',
		model: models.Assessquestion.coffee
,ce._core.models
