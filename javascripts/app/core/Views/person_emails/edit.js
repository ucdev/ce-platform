#! ce._core.views.person_emails.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.person_emails", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "person_emails/edit")

