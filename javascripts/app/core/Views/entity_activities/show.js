#! ce._core.views.entity_activities.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.entity_activities", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "entity_activities/show")

