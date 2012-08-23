#! ce._core.views.sys_apiclients.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_apiclients", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "sys_apiclients/edit")

