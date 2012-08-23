#! ce._core.views.subscriptions.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.subscriptions", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "subscriptions/show")

