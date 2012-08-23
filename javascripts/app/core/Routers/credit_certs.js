#! ce._core.routers.Credit_certs extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Credit_certs = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "credit_certs/:id/show": "show"
    "credit_certs/:id/edit": "edit"
  )

