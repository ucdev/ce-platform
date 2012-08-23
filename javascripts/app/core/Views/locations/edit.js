#! ce._core.views.locations.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.locations", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "locations/edit")

