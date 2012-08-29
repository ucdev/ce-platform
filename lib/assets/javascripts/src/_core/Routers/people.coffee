#! ce._core.routers.People extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.People = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "people/:id/show": "show"
    "people/:id/edit": "edit"
  )

