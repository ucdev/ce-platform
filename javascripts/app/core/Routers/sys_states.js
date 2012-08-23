#! ce._core.routers.Sys_states extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_states = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_states/:id/show": "show"
    "sys_states/:id/edit": "edit"
  )

