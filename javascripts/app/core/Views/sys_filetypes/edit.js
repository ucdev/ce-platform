#! ce._core.views.sys_filetypes.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_filetypes", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "sys_filetypes/edit")

