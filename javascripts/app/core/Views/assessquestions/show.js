#! ce._core.views.assessquestions.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.assessquestions", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "assessquestions/show")

