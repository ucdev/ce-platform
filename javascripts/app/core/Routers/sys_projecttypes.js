#! ce._core.routers.Sys_projecttypes extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_projecttypes = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_projecttypes/:id/show": "show"
    "sys_projecttypes/:id/edit": "edit"
  )

