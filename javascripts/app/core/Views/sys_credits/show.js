#! ce._core.views.sys_credits.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_credits", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "sys_credits/show")

