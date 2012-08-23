#! ce._core.views.activity_applications.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.activity_applications", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "activity_applications/edit")

