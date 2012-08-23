#! ce._core.routers.Geonames extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Geonames = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "geonames/:id/show": "show"
    "geonames/:id/edit": "edit"
  )

