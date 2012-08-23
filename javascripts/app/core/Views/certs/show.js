#! ce._core.views.certs.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.certs", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "certs/show")

