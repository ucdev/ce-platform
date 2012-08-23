#! ce._core.collections.Locationtype.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Locationtype.coffee = Backbone.Collection.extend
		url: '/locationtype.coffee/',
		model: models.Locationtype.coffee
,ce._core.models
