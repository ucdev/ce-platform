#! ce._core.routers.Degrees extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Degrees = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "degrees/:id/show": "show"
    "degrees/:id/edit": "edit"
  )

