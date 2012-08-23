#! ce._core.views.wheels.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.wheels", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "wheels/edit")

