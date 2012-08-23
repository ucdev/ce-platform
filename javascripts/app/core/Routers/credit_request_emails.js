#! ce._core.routers.Credit_request_emails extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Credit_request_emails = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "credit_request_emails/:id/show": "show"
    "credit_request_emails/:id/edit": "edit"
  )

