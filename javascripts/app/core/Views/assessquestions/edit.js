#! ce._core.views.assessquestions.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.assessquestions", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "assessquestions/edit")

