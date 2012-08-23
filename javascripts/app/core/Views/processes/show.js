#! ce._core.views.processes.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.processes", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "processes/show")

