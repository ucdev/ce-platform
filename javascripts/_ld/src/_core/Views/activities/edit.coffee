#! ce._core.views.activities.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.activities", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "activities/edit")

