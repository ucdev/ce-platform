#! ce._core.routers.Models extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Models = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "models/:id/show": "show"
    "models/:id/edit": "edit"
  )

