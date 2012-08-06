#! ce._core.views.main.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.main", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "main/show")

