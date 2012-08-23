#! ce._core.views.images.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.images", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "images/show")

