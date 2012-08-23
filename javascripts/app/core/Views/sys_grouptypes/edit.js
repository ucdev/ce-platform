#! ce._core.views.sys_grouptypes.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_grouptypes", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "sys_grouptypes/edit")

