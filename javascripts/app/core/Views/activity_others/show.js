#! ce._core.views.activity_others.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.activity_others", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "activity_others/show")

