#! ce._core.collections.Entity.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Entity.coffee = Backbone.Collection.extend
		url: '/entity.coffee/',
		model: models.Entity.coffee
,ce._core.models
