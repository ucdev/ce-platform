#! ce._core.views.authorities.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.authorities", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "authorities/show")

