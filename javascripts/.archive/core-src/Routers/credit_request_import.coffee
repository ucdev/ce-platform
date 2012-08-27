#! ce._core.routers.Credit_request_import.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Credit_request_import.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "credit_request_import.coffee/:id/show": "show"
    "credit_request_import.coffee/:id/edit": "edit"
  )

