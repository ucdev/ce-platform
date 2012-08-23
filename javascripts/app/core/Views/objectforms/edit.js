#! ce._core.views.objectforms.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.objectforms", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "objectforms/edit")

