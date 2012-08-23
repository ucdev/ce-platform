#! ce._core.views.entity_relates.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.entity_relates", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "entity_relates/show")

