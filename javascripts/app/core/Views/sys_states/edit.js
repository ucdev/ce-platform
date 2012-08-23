#! ce._core.views.sys_states.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_states", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "sys_states/edit")

