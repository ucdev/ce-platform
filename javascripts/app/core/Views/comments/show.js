#! ce._core.views.comments.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.comments", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "comments/show")

