#! ce._core.routers.Authorities extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Authorities = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "authorities/:id/show": "show"
    "authorities/:id/edit": "edit"
  )

