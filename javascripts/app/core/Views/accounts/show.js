#! ce._core.views.accounts.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.accounts", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "accounts/show")

