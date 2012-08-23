#! ce._core.views.person_users.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.person_users", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "person_users/show")

