#! ce._core.views.sys_supporttypes.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_supporttypes", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "sys_supporttypes/show")

