#! ce._core.collections.Process.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Process.coffee = Backbone.Collection.extend
		url: '/process.coffee/',
		model: models.Process.coffee
,ce._core.models
