#! ce._core.Collections.Assets extends Backbone.Collection */
ce.module "_core.Collections", (self, ce, Backbone, Marionette, $, _) ->
	self.Assets = Backbone.Collection.extend
		url: '/assets/',
		model: ce.Models.Asset
