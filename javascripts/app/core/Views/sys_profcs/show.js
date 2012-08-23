#! ce._core.views.sys_profcs.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_profcs", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "sys_profcs/show")

