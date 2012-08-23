#! ce._core.views.sys_emailstyles.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_emailstyles", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "sys_emailstyles/edit")

