#! ce._core.views.sys_ethnicities.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_ethnicities", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "sys_ethnicities/show")

