#! ce._core.routers.Sys_addresstypes extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_addresstypes = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_addresstypes/:id/show": "show"
    "sys_addresstypes/:id/edit": "edit"
  )

