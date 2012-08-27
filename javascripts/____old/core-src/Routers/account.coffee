#! ce._core.routers.Account.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Account.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "account.coffee/:id/show": "show"
    "account.coffee/:id/edit": "edit"
  )

