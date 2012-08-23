#! ce._core.views.activity_publishes.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.activity_publishes", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "activity_publishes/show")

