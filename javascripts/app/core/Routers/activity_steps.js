#! ce._core.routers.Activity_steps extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Activity_steps = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "activity_steps/:id/show": "show"
    "activity_steps/:id/edit": "edit"
  )

