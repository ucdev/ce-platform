#! ce._core.views.processmanagers.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.processmanagers", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "processmanagers/show")

