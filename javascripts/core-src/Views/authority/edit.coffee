#! ce._core.views.edit.coffee.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.edit.coffee", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "edit.coffee/edit")

