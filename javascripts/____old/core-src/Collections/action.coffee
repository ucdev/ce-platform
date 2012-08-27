#! ce._core.collections.Action.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Action.coffee = Backbone.Collection.extend
		url: '/action.coffee/',
		model: models.Action.coffee
,ce._core.models
