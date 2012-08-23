#! ce._core.routers.Subscription.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Subscription.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "subscription.coffee/:id/show": "show"
    "subscription.coffee/:id/edit": "edit"
  )

