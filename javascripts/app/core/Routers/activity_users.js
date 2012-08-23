#! ce._core.routers.Activity_users extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Activity_users = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "activity_users/:id/show": "show"
    "activity_users/:id/edit": "edit"
  )

