#! ce._core.views.comments.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.comments", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "comments/edit")

