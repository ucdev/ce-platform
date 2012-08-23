#! ce._core.views.sys_states.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_states", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "sys_states/show")

