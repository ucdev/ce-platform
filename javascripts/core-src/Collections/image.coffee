#! ce._core.collections.Image.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Image.coffee = Backbone.Collection.extend
		url: '/image.coffee/',
		model: models.Image.coffee
,ce._core.models
