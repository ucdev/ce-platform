#! ce._core.collections.Category.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Category.coffee = Backbone.Collection.extend
		url: '/category.coffee/',
		model: models.Category.coffee
,ce._core.models
