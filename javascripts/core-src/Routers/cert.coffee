#! ce._core.routers.Cert.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Cert.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "cert.coffee/:id/show": "show"
    "cert.coffee/:id/edit": "edit"
  )

