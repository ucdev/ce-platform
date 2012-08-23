#! ce._core.views.sys_statuses.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_statuses", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "sys_statuses/show")

