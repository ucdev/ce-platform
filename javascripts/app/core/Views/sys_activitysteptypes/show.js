#! ce._core.views.sys_activitysteptypes.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_activitysteptypes", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "sys_activitysteptypes/show")

