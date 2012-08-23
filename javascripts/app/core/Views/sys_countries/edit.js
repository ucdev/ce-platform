#! ce._core.views.sys_countries.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_countries", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "sys_countries/edit")

