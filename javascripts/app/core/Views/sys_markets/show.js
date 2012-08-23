#! ce._core.views.sys_markets.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_markets", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "sys_markets/show")

