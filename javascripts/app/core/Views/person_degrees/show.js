#! ce._core.views.person_degrees.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.person_degrees", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "person_degrees/show")

