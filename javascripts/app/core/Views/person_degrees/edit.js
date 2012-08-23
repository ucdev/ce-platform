#! ce._core.views.person_degrees.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.person_degrees", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "person_degrees/edit")

