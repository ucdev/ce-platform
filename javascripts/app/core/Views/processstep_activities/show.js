#! ce._core.views.processstep_activities.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.processstep_activities", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "processstep_activities/show")

