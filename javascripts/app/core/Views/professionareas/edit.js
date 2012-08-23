#! ce._core.views.professionareas.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.professionareas", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "professionareas/edit")

