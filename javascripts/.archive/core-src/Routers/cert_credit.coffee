#! ce._core.routers.Cert_credit.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Cert_credit.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "cert_credit.coffee/:id/show": "show"
    "cert_credit.coffee/:id/edit": "edit"
  )

