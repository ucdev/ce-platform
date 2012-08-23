#! ce._core.views.activity_pubcomponents.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.activity_pubcomponents", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "activity_pubcomponents/show")

