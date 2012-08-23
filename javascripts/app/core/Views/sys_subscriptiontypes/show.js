#! ce._core.views.sys_subscriptiontypes.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_subscriptiontypes", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "sys_subscriptiontypes/show")

