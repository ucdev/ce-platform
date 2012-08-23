#! ce._core.views.attendee_components.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.attendee_components", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "attendee_components/show")

