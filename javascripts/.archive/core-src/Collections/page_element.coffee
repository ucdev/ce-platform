#! ce._core.collections.Page_element.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Page_element.coffee = Backbone.Collection.extend
		url: '/page_element.coffee/',
		model: models.Page_element.coffee
,ce._core.models
