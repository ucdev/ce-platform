#! ce._core.routers.Credit_request_imports extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Credit_request_imports = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "credit_request_imports/:id/show": "show"
    "credit_request_imports/:id/edit": "edit"
  )

