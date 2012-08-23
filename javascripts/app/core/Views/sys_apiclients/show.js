#! ce._core.views.sys_apiclients.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_apiclients", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "sys_apiclients/show")

