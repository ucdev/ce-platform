#! ce._core.collections.Page_section.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Page_section.coffee = Backbone.Collection.extend
		url: '/page_section.coffee/',
		model: models.Page_section.coffee
,ce._core.models
