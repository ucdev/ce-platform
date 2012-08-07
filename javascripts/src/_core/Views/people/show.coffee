#! ce._core.views.people.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.people", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "people/show")

