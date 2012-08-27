#! ce._core.routers.Sys_role.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_role.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_role.coffee/:id/show": "show"
    "sys_role.coffee/:id/edit": "edit"
  )

