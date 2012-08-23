#! ce._core.collections.Pagelayout.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Pagelayout.coffee = Backbone.Collection.extend
		url: '/pagelayout.coffee/',
		model: models.Pagelayout.coffee
,ce._core.models
