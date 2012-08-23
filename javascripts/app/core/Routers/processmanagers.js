#! ce._core.routers.Processmanagers extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Processmanagers = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "processmanagers/:id/show": "show"
    "processmanagers/:id/edit": "edit"
  )

