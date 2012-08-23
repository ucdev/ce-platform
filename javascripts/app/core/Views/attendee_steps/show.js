#! ce._core.views.attendee_steps.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.attendee_steps", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "attendee_steps/show")

