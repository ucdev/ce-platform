#! ce._core.views.activity_comments.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.activity_comments", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "activity_comments/edit")

