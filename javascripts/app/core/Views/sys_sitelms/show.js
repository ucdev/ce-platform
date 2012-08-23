#! ce._core.views.sys_sitelms.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_sitelms", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "sys_sitelms/show")

