#! ce._core.routers.Cert_credits extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Cert_credits = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "cert_credits/:id/show": "show"
    "cert_credits/:id/edit": "edit"
  )

