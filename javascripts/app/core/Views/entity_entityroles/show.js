#! ce._core.views.entity_entityroles.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.entity_entityroles", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "entity_entityroles/show")

