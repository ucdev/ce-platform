#! ce._core.routers.Activities extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Activities = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "activities/:id/show": "show"
    "activities/:id/edit": "edit"
  )

