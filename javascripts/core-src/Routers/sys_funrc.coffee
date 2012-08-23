#! ce._core.routers.Sys_funrc.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_funrc.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_funrc.coffee/:id/show": "show"
    "sys_funrc.coffee/:id/edit": "edit"
  )

