#! ce._core.views.assets.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.assets", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "assets/edit")

