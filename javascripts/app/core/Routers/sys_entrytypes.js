#! ce._core.routers.Sys_entrytypes extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_entrytypes = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_entrytypes/:id/show": "show"
    "sys_entrytypes/:id/edit": "edit"
  )

