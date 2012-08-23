#! ce._core.views.activity_votes.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.activity_votes", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "activity_votes/edit")

