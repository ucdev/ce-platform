#! ce._core.collections.Processstep.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Processstep.coffee = Backbone.Collection.extend
		url: '/processstep.coffee/',
		model: models.Processstep.coffee
,ce._core.models
