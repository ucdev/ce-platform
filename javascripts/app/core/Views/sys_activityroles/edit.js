#! ce._core.views.sys_activityroles.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_activityroles", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "sys_activityroles/edit")

