#! ce._core.views.cert_credits.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.cert_credits", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "cert_credits/edit")

