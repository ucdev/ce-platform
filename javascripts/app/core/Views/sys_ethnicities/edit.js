#! ce._core.views.sys_ethnicities.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_ethnicities", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "sys_ethnicities/edit")

