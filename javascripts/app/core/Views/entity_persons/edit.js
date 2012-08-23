#! ce._core.views.entity_persons.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.entity_persons", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "entity_persons/edit")

