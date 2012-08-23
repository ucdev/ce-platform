#! ce._core.views.histories.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.histories", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "histories/show")

