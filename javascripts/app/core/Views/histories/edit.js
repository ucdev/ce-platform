#! ce._core.views.histories.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.histories", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "histories/edit")

