#! ce._core.routers.Sys_orgtypes extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_orgtypes = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_orgtypes/:id/show": "show"
    "sys_orgtypes/:id/edit": "edit"
  )

