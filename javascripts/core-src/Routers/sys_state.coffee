#! ce._core.routers.Sys_state.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_state.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_state.coffee/:id/show": "show"
    "sys_state.coffee/:id/edit": "edit"
  )

