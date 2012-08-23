#! ce._core.views.activity_users.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.activity_users", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "activity_users/edit")

