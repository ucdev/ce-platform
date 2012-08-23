#! ce._core.views.attendee_addresses.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.attendee_addresses", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "attendee_addresses/edit")

