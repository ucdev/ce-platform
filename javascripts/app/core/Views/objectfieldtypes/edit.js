#! ce._core.views.objectfieldtypes.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.objectfieldtypes", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "objectfieldtypes/edit")

