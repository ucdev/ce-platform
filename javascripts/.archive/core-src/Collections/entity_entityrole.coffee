#! ce._core.collections.Entity_entityrole.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Entity_entityrole.coffee = Backbone.Collection.extend
		url: '/entity_entityrole.coffee/',
		model: models.Entity_entityrole.coffee
,ce._core.models
