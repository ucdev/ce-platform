#! ce._core.views.geonames.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.geonames", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "geonames/show")

