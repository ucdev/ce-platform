#! ce._core.routers.Sys_activityrole.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_activityrole.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_activityrole.coffee/:id/show": "show"
    "sys_activityrole.coffee/:id/edit": "edit"
  )

