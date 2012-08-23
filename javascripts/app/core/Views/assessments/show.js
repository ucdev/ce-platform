#! ce._core.views.assessments.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.assessments", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "assessments/show")

