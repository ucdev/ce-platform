#! ce._core.views.entity_activities.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.entity_activities", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "entity_activities/edit")

