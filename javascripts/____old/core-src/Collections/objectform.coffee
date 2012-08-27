#! ce._core.collections.Objectform.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Objectform.coffee = Backbone.Collection.extend
		url: '/objectform.coffee/',
		model: models.Objectform.coffee
,ce._core.models
