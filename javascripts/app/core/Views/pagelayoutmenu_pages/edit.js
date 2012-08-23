#! ce._core.views.pagelayoutmenu_pages.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.pagelayoutmenu_pages", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "pagelayoutmenu_pages/edit")

