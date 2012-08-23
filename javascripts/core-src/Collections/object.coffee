#! ce._core.collections.Object.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Object.coffee = Backbone.Collection.extend
		url: '/object.coffee/',
		model: models.Object.coffee
,ce._core.models
