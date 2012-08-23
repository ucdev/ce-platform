#! ce._core.routers.Sys_activityroles extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_activityroles = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_activityroles/:id/show": "show"
    "sys_activityroles/:id/edit": "edit"
  )

