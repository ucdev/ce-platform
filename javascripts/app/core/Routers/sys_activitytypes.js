#! ce._core.routers.Sys_activitytypes extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_activitytypes = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_activitytypes/:id/show": "show"
    "sys_activitytypes/:id/edit": "edit"
  )

