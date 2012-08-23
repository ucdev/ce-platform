#! ce._core.routers.Sys_subscriptiontypes extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_subscriptiontypes = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_subscriptiontypes/:id/show": "show"
    "sys_subscriptiontypes/:id/edit": "edit"
  )

