#! ce._core.views.activity_steps.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.activity_steps", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "activity_steps/edit")

