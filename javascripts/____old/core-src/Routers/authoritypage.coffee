#! ce._core.routers.Authoritypage.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Authoritypage.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "authoritypage.coffee/:id/show": "show"
    "authoritypage.coffee/:id/edit": "edit"
  )

