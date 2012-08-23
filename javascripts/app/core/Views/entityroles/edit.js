#! ce._core.views.entityroles.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.entityroles", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "entityroles/edit")

