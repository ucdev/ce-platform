#! ce._core.views.sys_filetypes.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_filetypes", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "sys_filetypes/show")

