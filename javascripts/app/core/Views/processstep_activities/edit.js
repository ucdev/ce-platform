#! ce._core.views.processstep_activities.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.processstep_activities", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "processstep_activities/edit")

