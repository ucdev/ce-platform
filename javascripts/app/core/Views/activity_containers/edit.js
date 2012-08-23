#! ce._core.views.activity_containers.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.activity_containers", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "activity_containers/edit")

