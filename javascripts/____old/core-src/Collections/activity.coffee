#! ce._core.collections.Activity.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Activity.coffee = Backbone.Collection.extend
		url: '/activity.coffee/',
		model: models.Activity.coffee
,ce._core.models
