#! ce._core.collections.Pagelayoutmenu_page.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Pagelayoutmenu_page.coffee = Backbone.Collection.extend
		url: '/pagelayoutmenu_page.coffee/',
		model: models.Pagelayoutmenu_page.coffee
,ce._core.models
