#! ce._core.routers.Subscriptions extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Subscriptions = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "subscriptions/:id/show": "show"
    "subscriptions/:id/edit": "edit"
  )

