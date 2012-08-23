#! ce._core.views.entitytypes.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.entitytypes", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "entitytypes/edit")

