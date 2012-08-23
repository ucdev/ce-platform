#! ce._core.routers.Sys_filetypes extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_filetypes = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_filetypes/:id/show": "show"
    "sys_filetypes/:id/edit": "edit"
  )

