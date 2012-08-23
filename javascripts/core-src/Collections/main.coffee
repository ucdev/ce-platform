#! ce._core.collections.Main.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Main.coffee = Backbone.Collection.extend
		url: '/main.coffee/',
		model: models.Main.coffee
,ce._core.models
