#! ce._core.views.sys_degrees.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_degrees", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "sys_degrees/show")

