#! ce._core.collections.Objectdata.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Objectdata.coffee = Backbone.Collection.extend
		url: '/objectdata.coffee/',
		model: models.Objectdata.coffee
,ce._core.models
