#! ce._core.views.entity_credits.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.entity_credits", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "entity_credits/edit")

