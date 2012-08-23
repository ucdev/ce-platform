#! ce._core.views.activity_sites.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.activity_sites", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "activity_sites/show")

