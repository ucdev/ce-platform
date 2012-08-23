#! ce._core.views.sys_prinemps.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_prinemps", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "sys_prinemps/show")

