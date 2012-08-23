#! ce._core.views.entities.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.entities", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "entities/edit")

