#! ce._core.views.sys_roles.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_roles", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "sys_roles/show")

