#! ce._core.views.geonames.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.geonames", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "geonames/edit")

