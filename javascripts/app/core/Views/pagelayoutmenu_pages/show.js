#! ce._core.views.pagelayoutmenu_pages.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.pagelayoutmenu_pages", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "pagelayoutmenu_pages/show")

