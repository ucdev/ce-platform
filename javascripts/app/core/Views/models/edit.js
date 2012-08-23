#! ce._core.views.models.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.models", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "models/edit")

