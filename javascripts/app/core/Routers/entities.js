#! ce._core.routers.Entities extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Entities = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "entities/:id/show": "show"
    "entities/:id/edit": "edit"
  )

