#! ce._core.views.sys_components.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_components", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "sys_components/show")

