#! ce._core.routers.Sys_specialtylms.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_specialtylms.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_specialtylms.coffee/:id/show": "show"
    "sys_specialtylms.coffee/:id/edit": "edit"
  )

