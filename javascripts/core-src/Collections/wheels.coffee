#! ce._core.collections.Wheels.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Wheels.coffee = Backbone.Collection.extend
		url: '/wheels.coffee/',
		model: models.Wheels.coffee
,ce._core.models
