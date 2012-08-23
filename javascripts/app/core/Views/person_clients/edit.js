#! ce._core.views.person_clients.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.person_clients", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "person_clients/edit")

