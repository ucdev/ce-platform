#! ce._core.views.degrees.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.degrees", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "degrees/show")

