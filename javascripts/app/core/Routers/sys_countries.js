#! ce._core.routers.Sys_countries extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_countries = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_countries/:id/show": "show"
    "sys_countries/:id/edit": "edit"
  )

