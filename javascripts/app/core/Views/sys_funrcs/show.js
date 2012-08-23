#! ce._core.views.sys_funrcs.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_funrcs", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "sys_funrcs/show")

