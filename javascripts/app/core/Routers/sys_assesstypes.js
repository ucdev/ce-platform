#! ce._core.routers.Sys_assesstypes extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_assesstypes = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_assesstypes/:id/show": "show"
    "sys_assesstypes/:id/edit": "edit"
  )

