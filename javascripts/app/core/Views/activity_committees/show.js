#! ce._core.views.activity_committees.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.activity_committees", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "activity_committees/show")

