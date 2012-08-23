#! ce._core.views.sys_entrytypes.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_entrytypes", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "sys_entrytypes/show")

