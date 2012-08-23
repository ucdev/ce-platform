#! ce._core.views.sys_cbofunds.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_cbofunds", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "sys_cbofunds/edit")

