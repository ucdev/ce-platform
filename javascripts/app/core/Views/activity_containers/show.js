#! ce._core.views.activity_containers.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.activity_containers", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "activity_containers/show")

