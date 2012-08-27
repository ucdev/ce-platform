#! ce._core.collections.Objectfield.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Objectfield.coffee = Backbone.Collection.extend
		url: '/objectfield.coffee/',
		model: models.Objectfield.coffee
,ce._core.models
