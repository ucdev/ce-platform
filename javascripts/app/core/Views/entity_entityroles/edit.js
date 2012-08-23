#! ce._core.views.entity_entityroles.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.entity_entityroles", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "entity_entityroles/edit")

