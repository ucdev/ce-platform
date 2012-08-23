#! ce._core.views.models.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.models", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "models/show")

