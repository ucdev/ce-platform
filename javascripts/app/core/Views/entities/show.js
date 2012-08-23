#! ce._core.views.entities.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.entities", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "entities/show")

