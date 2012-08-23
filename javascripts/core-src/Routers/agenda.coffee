#! ce._core.routers.Agenda.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Agenda.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "agenda.coffee/:id/show": "show"
    "agenda.coffee/:id/edit": "edit"
  )

