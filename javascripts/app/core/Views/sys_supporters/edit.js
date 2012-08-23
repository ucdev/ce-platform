#! ce._core.views.sys_supporters.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_supporters", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "sys_supporters/edit")

