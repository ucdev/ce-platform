#! ce._core.views.authorities.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.authorities", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "authorities/edit")

