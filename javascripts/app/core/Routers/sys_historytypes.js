#! ce._core.routers.Sys_historytypes extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_historytypes = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_historytypes/:id/show": "show"
    "sys_historytypes/:id/edit": "edit"
  )

