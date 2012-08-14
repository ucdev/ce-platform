#! ce._core.routers.Credit_requests extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Credit_requests = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "credit_requests/:id/show": "show"
    "credit_requests/:id/edit": "edit"
  )

