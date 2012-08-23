#! ce._core.views.sys_stepstatuses.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_stepstatuses", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "sys_stepstatuses/edit")

