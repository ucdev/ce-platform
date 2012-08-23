#! ce._core.views.degrees.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.degrees", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "degrees/edit")

