#! ce._core.Collections.Main extends Backbone.Collection */
ce.module "_core.Collections", (self, ce, Backbone, Marionette, $, _) ->
	self.Main = Backbone.Collection.extend
		url: '/main/',
		model: ce.Models.Main
