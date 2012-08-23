#! ce._core.views.assessanswers.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.assessanswers", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "assessanswers/show")

