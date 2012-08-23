#! ce._core.routers.Sys_occclass.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_occclass.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_occclass.coffee/:id/show": "show"
    "sys_occclass.coffee/:id/edit": "edit"
  )

