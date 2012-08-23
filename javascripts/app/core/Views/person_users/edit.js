#! ce._core.views.person_users.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.person_users", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "person_users/edit")

