#! ce._core.views.occupations.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.occupations", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "occupations/edit")

