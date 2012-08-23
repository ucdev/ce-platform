#! ce._core.views.credit_requests.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.credit_requests", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "credit_requests/edit")

