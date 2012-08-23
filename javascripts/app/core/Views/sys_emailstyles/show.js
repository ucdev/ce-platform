#! ce._core.views.sys_emailstyles.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_emailstyles", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "sys_emailstyles/show")

