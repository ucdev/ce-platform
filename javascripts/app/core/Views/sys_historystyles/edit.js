#! ce._core.views.sys_historystyles.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_historystyles", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "sys_historystyles/edit")

