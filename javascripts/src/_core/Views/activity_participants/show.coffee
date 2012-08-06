#! ce.Views.Activity_participants.ShowView extends Backbone.Marionette.ItemView 
ce.module "Views.Activity_participants", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "activity_participants/show")

