#! ce._core.routers.Credit_cert.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Credit_cert.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "credit_cert.coffee/:id/show": "show"
    "credit_cert.coffee/:id/edit": "edit"
  )

