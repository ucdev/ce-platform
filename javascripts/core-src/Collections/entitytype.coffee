#! ce._core.collections.Entitytype.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Entitytype.coffee = Backbone.Collection.extend
		url: '/entitytype.coffee/',
		model: models.Entitytype.coffee
,ce._core.models
