#! ce._core.views.sys_activityroles.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_activityroles", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "sys_activityroles/show")

