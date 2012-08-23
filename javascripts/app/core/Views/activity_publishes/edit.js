#! ce._core.views.activity_publishes.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.activity_publishes", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "activity_publishes/edit")

