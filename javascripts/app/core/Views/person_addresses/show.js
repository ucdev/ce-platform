#! ce._core.views.person_addresses.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.person_addresses", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "person_addresses/show")

