#! ce._core.routers.Objects extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Objects = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "objects/:id/show": "show"
    "objects/:id/edit": "edit"
  )

