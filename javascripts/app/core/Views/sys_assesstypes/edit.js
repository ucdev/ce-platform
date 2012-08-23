#! ce._core.views.sys_assesstypes.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_assesstypes", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "sys_assesstypes/edit")

