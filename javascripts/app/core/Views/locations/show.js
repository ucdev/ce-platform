#! ce._core.views.locations.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.locations", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "locations/show")

