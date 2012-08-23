#! ce._core.views.categories.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.categories", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "categories/show")

