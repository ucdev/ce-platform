#! ce._core.views.objecttypes.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.objecttypes", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "objecttypes/edit")

