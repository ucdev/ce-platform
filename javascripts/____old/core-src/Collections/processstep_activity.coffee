#! ce._core.collections.Processstep_activity.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Processstep_activity.coffee = Backbone.Collection.extend
		url: '/processstep_activity.coffee/',
		model: models.Processstep_activity.coffee
,ce._core.models
