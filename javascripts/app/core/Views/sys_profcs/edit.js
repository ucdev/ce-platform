#! ce._core.views.sys_profcs.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_profcs", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "sys_profcs/edit")

