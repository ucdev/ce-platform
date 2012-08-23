#! ce._core.views.attendee_steps.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.attendee_steps", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "attendee_steps/edit")

