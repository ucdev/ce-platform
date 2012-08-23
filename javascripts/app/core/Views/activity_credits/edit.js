#! ce._core.views.activity_credits.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.activity_credits", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "activity_credits/edit")

