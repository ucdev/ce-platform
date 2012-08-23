#! ce._core.views.locationtypes.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.locationtypes", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "locationtypes/edit")

