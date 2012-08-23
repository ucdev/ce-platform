#! ce._core.views.pages.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.pages", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "pages/edit")

