#! ce._core.routers.Objectforms extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Objectforms = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "objectforms/:id/show": "show"
    "objectforms/:id/edit": "edit"
  )

