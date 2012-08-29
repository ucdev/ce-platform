#! ce._core.views.activities.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.activities", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "activities/show")

