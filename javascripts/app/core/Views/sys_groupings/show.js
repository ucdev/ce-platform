#! ce._core.views.sys_groupings.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_groupings", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "sys_groupings/show")

