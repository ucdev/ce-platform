#! ce._core.collections.Location.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Location.coffee = Backbone.Collection.extend
		url: '/location.coffee/',
		model: models.Location.coffee
,ce._core.models
