#! ce._core.collections.Imagetype.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Imagetype.coffee = Backbone.Collection.extend
		url: '/imagetype.coffee/',
		model: models.Imagetype.coffee
,ce._core.models
