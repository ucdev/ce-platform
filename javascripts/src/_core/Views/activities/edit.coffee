#! ce.Views.Activities.EditView extends Backbone.Marionette.ItemView 
ce.module "Views.Activities", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "activities/edit")

