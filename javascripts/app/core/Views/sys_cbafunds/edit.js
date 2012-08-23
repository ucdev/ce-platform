#! ce._core.views.sys_cbafunds.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_cbafunds", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "sys_cbafunds/edit")

