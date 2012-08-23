#! ce._core.views.assessments.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.assessments", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "assessments/edit")

