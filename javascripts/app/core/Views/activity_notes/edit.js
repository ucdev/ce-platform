#! ce._core.views.activity_notes.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.activity_notes", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "activity_notes/edit")

