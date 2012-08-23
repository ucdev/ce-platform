#! ce._core.views.sys_historytypes.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_historytypes", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "sys_historytypes/show")

