#! ce._core.views.sys_activitytypes.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_activitytypes", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "sys_activitytypes/edit")

