#! ce._core.views.credit_certs.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.credit_certs", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "credit_certs/edit")

