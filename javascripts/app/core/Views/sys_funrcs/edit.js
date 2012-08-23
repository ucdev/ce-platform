#! ce._core.views.sys_funrcs.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_funrcs", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "sys_funrcs/edit")

