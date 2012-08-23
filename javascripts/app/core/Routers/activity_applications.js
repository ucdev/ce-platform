#! ce._core.routers.Activity_applications extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Activity_applications = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "activity_applications/:id/show": "show"
    "activity_applications/:id/edit": "edit"
  )

