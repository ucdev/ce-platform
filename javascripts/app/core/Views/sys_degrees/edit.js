#! ce._core.views.sys_degrees.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_degrees", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "sys_degrees/edit")

