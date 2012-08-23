#! ce._core.views.activity_users.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.activity_users", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "activity_users/show")

