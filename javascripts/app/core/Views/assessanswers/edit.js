#! ce._core.views.assessanswers.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.assessanswers", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "assessanswers/edit")

