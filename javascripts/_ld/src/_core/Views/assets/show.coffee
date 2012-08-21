#! ce._core.views.assets.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.assets", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "assets/show")

