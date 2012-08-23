#! ce._core.views.locationtypes.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.locationtypes", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "locationtypes/show")

