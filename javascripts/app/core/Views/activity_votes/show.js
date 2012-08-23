#! ce._core.views.activity_votes.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.activity_votes", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "activity_votes/show")

