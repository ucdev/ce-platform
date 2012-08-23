#! ce._core.views.entity_entitytypes.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.entity_entitytypes", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "entity_entitytypes/edit")

