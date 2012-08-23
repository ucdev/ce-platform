#! ce._core.routers.Sys_profcs extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_profcs = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_profcs/:id/show": "show"
    "sys_profcs/:id/edit": "edit"
  )

