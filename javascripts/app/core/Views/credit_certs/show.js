#! ce._core.views.credit_certs.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.credit_certs", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "credit_certs/show")

