#! ce._core.routers.Sys_testtypes extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_testtypes = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_testtypes/:id/show": "show"
    "sys_testtypes/:id/edit": "edit"
  )

