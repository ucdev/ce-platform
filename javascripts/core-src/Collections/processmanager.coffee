#! ce._core.collections.Processmanager.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Processmanager.coffee = Backbone.Collection.extend
		url: '/processmanager.coffee/',
		model: models.Processmanager.coffee
,ce._core.models
