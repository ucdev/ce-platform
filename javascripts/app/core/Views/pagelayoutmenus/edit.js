#! ce._core.views.pagelayoutmenus.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.pagelayoutmenus", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "pagelayoutmenus/edit")

