#! ce._core.views.wheels.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.wheels", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "wheels/show")

