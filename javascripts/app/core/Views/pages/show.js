#! ce._core.views.pages.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.pages", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "pages/show")

