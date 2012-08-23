#! ce._core.views.entity_relates.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.entity_relates", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "entity_relates/edit")

