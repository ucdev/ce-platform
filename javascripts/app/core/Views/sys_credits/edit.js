#! ce._core.views.sys_credits.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_credits", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "sys_credits/edit")

