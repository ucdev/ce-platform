#! ce._core.routers.Sys_subscriptiontype.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Sys_subscriptiontype.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "sys_subscriptiontype.coffee/:id/show": "show"
    "sys_subscriptiontype.coffee/:id/edit": "edit"
  )

