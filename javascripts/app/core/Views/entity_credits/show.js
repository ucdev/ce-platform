#! ce._core.views.entity_credits.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.entity_credits", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "entity_credits/show")

