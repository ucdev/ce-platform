#! ce._core.routers.Sys_specialtylms extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_specialtylms = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_specialtylms/:id/show": "show"
    "sys_specialtylms/:id/edit": "edit"
  )

