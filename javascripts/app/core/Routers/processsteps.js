#! ce._core.routers.Processsteps extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Processsteps = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "processsteps/:id/show": "show"
    "processsteps/:id/edit": "edit"
  )

