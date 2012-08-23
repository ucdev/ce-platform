#! ce._core.views.objectfields.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.objectfields", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "objectfields/edit")

