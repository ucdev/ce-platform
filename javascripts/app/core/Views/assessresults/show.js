#! ce._core.views.assessresults.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.assessresults", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "assessresults/show")

