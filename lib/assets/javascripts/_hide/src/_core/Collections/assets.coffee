#! ce._core.collections.Assets extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Assets = Backbone.Collection.extend
		url: '/assets/',
		model: models.Asset
,ce._core.models
