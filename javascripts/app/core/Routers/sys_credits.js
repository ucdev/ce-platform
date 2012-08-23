#! ce._core.routers.Sys_credits extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_credits = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_credits/:id/show": "show"
    "sys_credits/:id/edit": "edit"
  )

