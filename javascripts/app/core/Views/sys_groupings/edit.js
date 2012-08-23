#! ce._core.views.sys_groupings.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_groupings", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "sys_groupings/edit")

