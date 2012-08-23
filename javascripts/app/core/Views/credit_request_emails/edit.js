#! ce._core.views.credit_request_emails.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.credit_request_emails", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "credit_request_emails/edit")

