#! ce._core.collections.Model.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Model.coffee = Backbone.Collection.extend
		url: '/model.coffee/',
		model: models.Model.coffee
,ce._core.models
