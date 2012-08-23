#! ce._core.views.sys_subscriptiontypes.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_subscriptiontypes", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "sys_subscriptiontypes/edit")

