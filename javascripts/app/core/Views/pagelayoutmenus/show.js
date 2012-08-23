#! ce._core.views.pagelayoutmenus.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.pagelayoutmenus", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "pagelayoutmenus/show")

