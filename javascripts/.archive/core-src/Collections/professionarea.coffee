#! ce._core.collections.Professionarea.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Professionarea.coffee = Backbone.Collection.extend
		url: '/professionarea.coffee/',
		model: models.Professionarea.coffee
,ce._core.models
