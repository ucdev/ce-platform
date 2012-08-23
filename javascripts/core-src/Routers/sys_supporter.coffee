#! ce._core.routers.Sys_supporter.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_supporter.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_supporter.coffee/:id/show": "show"
    "sys_supporter.coffee/:id/edit": "edit"
  )

