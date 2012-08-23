#! ce._core.routers.Activity_pubsteps extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Activity_pubsteps = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "activity_pubsteps/:id/show": "show"
    "activity_pubsteps/:id/edit": "edit"
  )

