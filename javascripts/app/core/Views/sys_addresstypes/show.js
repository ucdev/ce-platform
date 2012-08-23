#! ce._core.views.sys_addresstypes.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_addresstypes", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "sys_addresstypes/show")

