#! ce._core.views.filegroups.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.filegroups", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "filegroups/edit")

