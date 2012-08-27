#! ce._core.routers.Geoname.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Geoname.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "geoname.coffee/:id/show": "show"
    "geoname.coffee/:id/edit": "edit"
  )

