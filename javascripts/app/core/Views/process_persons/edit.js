#! ce._core.views.process_persons.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.process_persons", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "process_persons/edit")

