#! ce._core.views.activity_notes.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.activity_notes", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "activity_notes/show")

