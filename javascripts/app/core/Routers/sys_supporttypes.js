#! ce._core.routers.Sys_supporttypes extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_supporttypes = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_supporttypes/:id/show": "show"
    "sys_supporttypes/:id/edit": "edit"
  )

