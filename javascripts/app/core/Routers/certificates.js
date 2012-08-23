#! ce._core.routers.Certificates extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Certificates = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "certificates/:id/show": "show"
    "certificates/:id/edit": "edit"
  )

