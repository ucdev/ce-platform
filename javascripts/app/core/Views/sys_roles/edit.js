#! ce._core.views.sys_roles.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_roles", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "sys_roles/edit")

