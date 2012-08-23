#! ce._core.views.credit_request_emails.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.credit_request_emails", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "credit_request_emails/show")

