#! ce._core.views.sys_statuses.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_statuses", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "sys_statuses/edit")

