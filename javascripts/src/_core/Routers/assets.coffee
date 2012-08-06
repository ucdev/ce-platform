#! ce._core.routers.Assets extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Assets = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "assets/:id/show": "show"
    "assets/:id/edit": "edit"
  )

