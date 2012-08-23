#! ce._core.collections.Page.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Page.coffee = Backbone.Collection.extend
		url: '/page.coffee/',
		model: models.Page.coffee
,ce._core.models
