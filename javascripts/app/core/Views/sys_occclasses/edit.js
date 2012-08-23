#! ce._core.views.sys_occclasses.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.sys_occclasses", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "sys_occclasses/edit")

