#! ce._core.views.assessresults.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.assessresults", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "assessresults/edit")

