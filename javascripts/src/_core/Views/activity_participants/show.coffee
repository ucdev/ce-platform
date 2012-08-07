#! ce._core.views.activity_participants.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.activity_participants", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "activity_participants/show")

