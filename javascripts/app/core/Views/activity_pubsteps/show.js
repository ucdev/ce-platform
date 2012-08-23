#! ce._core.views.activity_pubsteps.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.activity_pubsteps", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "activity_pubsteps/show")

