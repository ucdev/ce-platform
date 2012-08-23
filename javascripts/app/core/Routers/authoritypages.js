#! ce._core.routers.Authoritypages extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Authoritypages = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "authoritypages/:id/show": "show"
    "authoritypages/:id/edit": "edit"
  )

