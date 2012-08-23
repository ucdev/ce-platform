#! ce._core.views.activity_applications.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.activity_applications", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "activity_applications/show")

