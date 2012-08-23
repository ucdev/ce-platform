#! ce._core.views.sys_funrns.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_funrns", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "sys_funrns/show")

