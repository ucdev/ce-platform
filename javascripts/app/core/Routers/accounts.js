#! ce._core.routers.Accounts extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Accounts = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "accounts/:id/show": "show"
    "accounts/:id/edit": "edit"
  )

