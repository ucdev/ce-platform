#! ce._core.views.sys_sitelms.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_sitelms", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "sys_sitelms/edit")

