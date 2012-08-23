#! ce._core.routers.Sys_profns extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_profns = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_profns/:id/show": "show"
    "sys_profns/:id/edit": "edit"
  )

