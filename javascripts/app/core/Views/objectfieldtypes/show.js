#! ce._core.views.objectfieldtypes.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.objectfieldtypes", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "objectfieldtypes/show")

