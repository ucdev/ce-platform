#! ce._core.views.agendas.EditView extends Backbone.Marionette.ItemView 
ce.module "_core.views.agendas", (self, ce, Backbone, Marionette, $, _) ->
  self.EditView = Backbone.Marionette.ItemView.extend(template: "agendas/edit")

