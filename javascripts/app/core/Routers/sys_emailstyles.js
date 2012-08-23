#! ce._core.routers.Sys_emailstyles extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_emailstyles = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_emailstyles/:id/show": "show"
    "sys_emailstyles/:id/edit": "edit"
  )

