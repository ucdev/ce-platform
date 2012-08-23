#! ce._core.views.sys_activitytypes.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_activitytypes", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "sys_activitytypes/show")

