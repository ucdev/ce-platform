#! ce._core.views.people.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.people", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "people/edit")

