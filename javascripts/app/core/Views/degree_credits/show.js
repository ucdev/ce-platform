#! ce._core.views.degree_credits.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.degree_credits", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "degree_credits/show")

