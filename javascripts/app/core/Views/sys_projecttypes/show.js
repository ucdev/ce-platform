#! ce._core.views.sys_projecttypes.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_projecttypes", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "sys_projecttypes/show")

