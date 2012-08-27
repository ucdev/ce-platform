#! ce._core.collections.Group.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Group.coffee = Backbone.Collection.extend
		url: '/group.coffee/',
		model: models.Group.coffee
,ce._core.models
