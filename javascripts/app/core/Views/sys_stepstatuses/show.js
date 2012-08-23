#! ce._core.views.sys_stepstatuses.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_stepstatuses", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "sys_stepstatuses/show")

