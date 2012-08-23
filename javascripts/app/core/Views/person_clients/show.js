#! ce._core.views.person_clients.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.person_clients", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "person_clients/show")

