#! ce._core.routers.Certs extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Certs = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "certs/:id/show": "show"
    "certs/:id/edit": "edit"
  )

