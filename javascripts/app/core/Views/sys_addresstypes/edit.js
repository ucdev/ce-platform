#! ce._core.views.sys_addresstypes.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_addresstypes", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "sys_addresstypes/edit")

