#! ce._core.views.sys_historytypes.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_historytypes", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "sys_historytypes/edit")

