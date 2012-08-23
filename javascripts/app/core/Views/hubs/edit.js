#! ce._core.views.hubs.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.hubs", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "hubs/edit")

