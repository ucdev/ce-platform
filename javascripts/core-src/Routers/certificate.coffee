#! ce._core.routers.Certificate.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Certificate.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "certificate.coffee/:id/show": "show"
    "certificate.coffee/:id/edit": "edit"
  )

