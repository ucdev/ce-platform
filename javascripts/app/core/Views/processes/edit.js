#! ce._core.views.processes.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.processes", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "processes/edit")

