#! ce._core.collections.History.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.History.coffee = Backbone.Collection.extend
		url: '/history.coffee/',
		model: models.History.coffee
,ce._core.models
