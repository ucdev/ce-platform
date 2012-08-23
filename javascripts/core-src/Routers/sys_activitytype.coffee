#! ce._core.routers.Sys_activitytype.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_activitytype.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_activitytype.coffee/:id/show": "show"
    "sys_activitytype.coffee/:id/edit": "edit"
  )

