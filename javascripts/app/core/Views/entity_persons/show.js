#! ce._core.views.entity_persons.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.entity_persons", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "entity_persons/show")

