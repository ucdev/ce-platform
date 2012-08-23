#! ce._core.routers.Sys_groupings extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_groupings = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_groupings/:id/show": "show"
    "sys_groupings/:id/edit": "edit"
  )

