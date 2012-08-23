#! ce._core.collections.Pagelayoutmenu.coffee extends Backbone.Collection */
ce.module "_core.collections", (self, ce, Backbone, Marionette, $, _, models) ->
	self.Pagelayoutmenu.coffee = Backbone.Collection.extend
		url: '/pagelayoutmenu.coffee/',
		model: models.Pagelayoutmenu.coffee
,ce._core.models
