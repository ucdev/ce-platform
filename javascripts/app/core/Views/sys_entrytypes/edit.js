#! ce._core.views.sys_entrytypes.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_entrytypes", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "sys_entrytypes/edit")

