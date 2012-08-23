#! ce._core.views.pagelayouts.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.pagelayouts", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "pagelayouts/show")

