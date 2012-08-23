#! ce._core.collections.Entity_activity.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Entity_activity.coffee = Backbone.Collection.extend
		url: '/entity_activity.coffee/',
		model: models.Entity_activity.coffee
,ce._core.models
