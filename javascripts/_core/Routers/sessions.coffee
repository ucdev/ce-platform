#! ce._core.routers.Sessions extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sessions = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sessions/:id/show": "show"
    "sessions/:id/edit": "edit"
  )

