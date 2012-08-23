#! ce._core.views.subscriptions.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.subscriptions", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "subscriptions/edit")

