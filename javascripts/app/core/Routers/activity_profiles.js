#! ce._core.routers.Activity_profiles extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Activity_profiles = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "activity_profiles/:id/show": "show"
    "activity_profiles/:id/edit": "edit"
  )

