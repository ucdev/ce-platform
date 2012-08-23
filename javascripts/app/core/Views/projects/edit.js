#! ce._core.views.projects.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.projects", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "projects/edit")

