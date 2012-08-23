#! ce._core.views.activity_steps.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.activity_steps", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "activity_steps/show")

