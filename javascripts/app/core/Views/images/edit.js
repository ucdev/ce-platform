#! ce._core.views.images.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.images", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "images/edit")

