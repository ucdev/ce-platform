#! ce._core.views.activity_profiles.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.activity_profiles", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "activity_profiles/edit")

