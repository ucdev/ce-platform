#! ce._core.collections.Entity_relate.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Entity_relate.coffee = Backbone.Collection.extend
		url: '/entity_relate.coffee/',
		model: models.Entity_relate.coffee
,ce._core.models
