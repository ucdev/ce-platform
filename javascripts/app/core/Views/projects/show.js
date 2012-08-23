#! ce._core.views.projects.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.projects", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "projects/show")

