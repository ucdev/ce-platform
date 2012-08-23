#! ce._core.views.files.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.files", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "files/edit")

