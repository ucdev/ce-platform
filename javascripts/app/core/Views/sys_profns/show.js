#! ce._core.views.sys_profns.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_profns", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "sys_profns/show")

