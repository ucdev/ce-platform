#! ce._core.routers.Agendas extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Agendas = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "agendas/:id/show": "show"
    "agendas/:id/edit": "edit"
  )

