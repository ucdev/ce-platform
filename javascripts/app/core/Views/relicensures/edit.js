#! ce._core.views.relicensures.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.relicensures", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "relicensures/edit")

