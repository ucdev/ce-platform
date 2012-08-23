#! ce._core.views.entity_entitytypes.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.entity_entitytypes", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "entity_entitytypes/show")

