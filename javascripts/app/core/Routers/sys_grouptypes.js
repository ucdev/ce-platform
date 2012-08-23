#! ce._core.routers.Sys_grouptypes extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_grouptypes = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_grouptypes/:id/show": "show"
    "sys_grouptypes/:id/edit": "edit"
  )

