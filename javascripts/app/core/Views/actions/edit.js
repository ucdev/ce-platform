#! ce._core.views.actions.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.actions", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "actions/edit")

