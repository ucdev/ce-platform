#! ce._core.routers.Sys_activitysteptype.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_activitysteptype.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_activitysteptype.coffee/:id/show": "show"
    "sys_activitysteptype.coffee/:id/edit": "edit"
  )

