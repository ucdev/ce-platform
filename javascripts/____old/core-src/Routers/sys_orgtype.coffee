#! ce._core.routers.Sys_orgtype.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_orgtype.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_orgtype.coffee/:id/show": "show"
    "sys_orgtype.coffee/:id/edit": "edit"
  )

