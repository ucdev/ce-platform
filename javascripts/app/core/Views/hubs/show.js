#! ce._core.views.hubs.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.hubs", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "hubs/show")

