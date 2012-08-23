#! ce._core.collections.Occupation.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Occupation.coffee = Backbone.Collection.extend
		url: '/occupation.coffee/',
		model: models.Occupation.coffee
,ce._core.models
