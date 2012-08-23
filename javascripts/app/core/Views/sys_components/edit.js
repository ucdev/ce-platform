#! ce._core.views.sys_components.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_components", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "sys_components/edit")

