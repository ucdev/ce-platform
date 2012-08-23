#! ce._core.views.sys_categorylms.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_categorylms", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "sys_categorylms/show")

