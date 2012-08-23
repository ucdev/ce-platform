#! ce._core.views.sys_supporters.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_supporters", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "sys_supporters/show")

