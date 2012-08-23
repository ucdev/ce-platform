#! ce._core.views.person_notes.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.person_notes", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "person_notes/show")

