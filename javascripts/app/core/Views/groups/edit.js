#! ce._core.views.groups.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.groups", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "groups/edit")

