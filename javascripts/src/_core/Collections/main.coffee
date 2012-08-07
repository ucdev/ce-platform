#! ce._core.collections.Main extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Main = Backbone.Collection.extend
		url: '/main/',
		model: models.Main
,ce._core.models
