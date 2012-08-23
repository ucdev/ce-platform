#! ce._core.views.pagelayouts.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.pagelayouts", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "pagelayouts/edit")

