#! ce._core.views.attendee_addresses.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.attendee_addresses", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "attendee_addresses/show")

