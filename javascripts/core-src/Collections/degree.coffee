#! ce._core.collections.Degree.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Degree.coffee = Backbone.Collection.extend
		url: '/degree.coffee/',
		model: models.Degree.coffee
,ce._core.models
