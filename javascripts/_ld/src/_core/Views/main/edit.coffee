#! ce._core.views.main.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.main", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "main/edit")

