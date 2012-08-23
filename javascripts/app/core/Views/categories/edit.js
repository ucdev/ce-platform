#! ce._core.views.categories.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.categories", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "categories/edit")

