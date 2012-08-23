#! ce._core.routers.Credit_request.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Credit_request.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "credit_request.coffee/:id/show": "show"
    "credit_request.coffee/:id/edit": "edit"
  )

