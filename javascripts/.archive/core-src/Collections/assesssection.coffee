#! ce._core.collections.Assesssection.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Assesssection.coffee = Backbone.Collection.extend
		url: '/assesssection.coffee/',
		model: models.Assesssection.coffee
,ce._core.models
