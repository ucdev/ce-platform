#! ce._core.routers.Sys_activitysteptypes extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_activitysteptypes = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_activitysteptypes/:id/show": "show"
    "sys_activitysteptypes/:id/edit": "edit"
  )

