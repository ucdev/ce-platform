#! ce._core.routers.Wheels extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Wheels = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "wheels/:id/show": "show"
    "wheels/:id/edit": "edit"
  )

