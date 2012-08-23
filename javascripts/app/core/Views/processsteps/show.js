#! ce._core.views.processsteps.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.processsteps", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "processsteps/show")

