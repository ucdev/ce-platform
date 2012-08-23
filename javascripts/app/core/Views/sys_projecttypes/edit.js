#! ce._core.views.sys_projecttypes.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_projecttypes", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "sys_projecttypes/edit")

