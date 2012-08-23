#! ce._core.views.person_addresses.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.person_addresses", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "person_addresses/edit")

