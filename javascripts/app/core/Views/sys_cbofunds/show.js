#! ce._core.views.sys_cbofunds.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_cbofunds", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "sys_cbofunds/show")

