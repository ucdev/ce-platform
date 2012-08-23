#! ce._core.views.degree_credits.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.degree_credits", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "degree_credits/edit")

