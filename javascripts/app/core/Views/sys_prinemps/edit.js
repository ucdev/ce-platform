#! ce._core.views.sys_prinemps.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_prinemps", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "sys_prinemps/edit")

