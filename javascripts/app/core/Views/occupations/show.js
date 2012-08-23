#! ce._core.views.occupations.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.occupations", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "occupations/show")

