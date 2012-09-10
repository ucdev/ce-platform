#! ce._core.collections.Activities extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Activities = Backbone.Collection.extend
		url: '/activities/',
		model: models.Activity
,ce._core.models
