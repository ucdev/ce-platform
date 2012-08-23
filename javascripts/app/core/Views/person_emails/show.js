#! ce._core.views.person_emails.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.person_emails", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "person_emails/show")

