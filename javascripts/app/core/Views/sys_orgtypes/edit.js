#! ce._core.views.sys_orgtypes.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_orgtypes", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "sys_orgtypes/edit")

