#! ce._core.views.person_notes.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.person_notes", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "person_notes/edit")

