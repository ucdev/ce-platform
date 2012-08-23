#! ce._core.views.agendas.ShowView extends Backbone.Marionette.ItemView 
ce.module "_core.views.agendas", (self, ce, Backbone, Marionette, $, _) ->
  self.ShowView = Backbone.Marionette.ItemView.extend(template: "agendas/show")

