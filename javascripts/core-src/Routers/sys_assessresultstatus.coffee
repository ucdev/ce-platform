#! ce._core.routers.Sys_assessresultstatus.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_assessresultstatus.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_assessresultstatus.coffee/:id/show": "show"
    "sys_assessresultstatus.coffee/:id/edit": "edit"
  )

