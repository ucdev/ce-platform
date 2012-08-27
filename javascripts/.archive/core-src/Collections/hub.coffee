#! ce._core.collections.Hub.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Hub.coffee = Backbone.Collection.extend
		url: '/hub.coffee/',
		model: models.Hub.coffee
,ce._core.models
