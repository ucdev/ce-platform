#! ce._core.views.attendee_components.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.attendee_components", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "attendee_components/edit")

