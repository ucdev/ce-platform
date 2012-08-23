#! ce._core.views.sys_testtypes.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_testtypes", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "sys_testtypes/show")

