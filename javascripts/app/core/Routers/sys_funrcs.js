#! ce._core.routers.Sys_funrcs extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_funrcs = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_funrcs/:id/show": "show"
    "sys_funrcs/:id/edit": "edit"
  )

