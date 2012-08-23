#! ce._core.views.attendees.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.attendees", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "attendees/edit")

