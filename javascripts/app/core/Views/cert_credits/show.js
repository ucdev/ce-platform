#! ce._core.views.cert_credits.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.cert_credits", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "cert_credits/show")

