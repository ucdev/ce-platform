#! ce._core.routers.Activity_profile.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Activity_profile.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "activity_profile.coffee/:id/show": "show"
    "activity_profile.coffee/:id/edit": "edit"
  )

