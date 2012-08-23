#! ce._core.views.attendees.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.attendees", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "attendees/show")

