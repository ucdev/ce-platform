#! ce._core.views.sys_testtypes.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_testtypes", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "sys_testtypes/edit")

