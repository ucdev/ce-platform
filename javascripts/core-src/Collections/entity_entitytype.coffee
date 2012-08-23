#! ce._core.collections.Entity_entitytype.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Entity_entitytype.coffee = Backbone.Collection.extend
		url: '/entity_entitytype.coffee/',
		model: models.Entity_entitytype.coffee
,ce._core.models
