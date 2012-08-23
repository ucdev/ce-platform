#! ce._core.views.sys_stat_types.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_stat_types", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "sys_stat_types/edit")

