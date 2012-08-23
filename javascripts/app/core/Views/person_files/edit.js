#! ce._core.views.person_files.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.person_files", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "person_files/edit")

