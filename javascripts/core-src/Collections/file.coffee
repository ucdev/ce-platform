#! ce._core.collections.File.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.File.coffee = Backbone.Collection.extend
		url: '/file.coffee/',
		model: models.File.coffee
,ce._core.models
