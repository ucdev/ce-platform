#! ce._core.views.objectfields.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.objectfields", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "objectfields/show")

