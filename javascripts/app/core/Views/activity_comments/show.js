#! ce._core.views.activity_comments.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.activity_comments", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "activity_comments/show")

