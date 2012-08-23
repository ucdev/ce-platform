#! ce._core.views.grouptypes.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.grouptypes", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "grouptypes/show")

