#! ce._core.views.sys_supporttypes.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_supporttypes", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "sys_supporttypes/edit")

