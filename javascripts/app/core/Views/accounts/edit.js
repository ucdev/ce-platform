#! ce._core.views.accounts.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.accounts", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "accounts/edit")

