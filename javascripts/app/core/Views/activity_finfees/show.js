#! ce._core.views.activity_finfees.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.activity_finfees", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "activity_finfees/show")

