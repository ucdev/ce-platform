#! ce._core.views.assesssections.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.assesssections", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "assesssections/edit")

