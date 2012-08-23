#! ce._core.routers.Sys_supporters extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_supporters = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_supporters/:id/show": "show"
    "sys_supporters/:id/edit": "edit"
  )

