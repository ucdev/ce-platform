#! ce._core.views.activity_pubsteps.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.activity_pubsteps", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "activity_pubsteps/edit")

