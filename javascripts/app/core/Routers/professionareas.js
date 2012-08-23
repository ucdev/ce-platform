#! ce._core.routers.Professionareas extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Professionareas = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "professionareas/:id/show": "show"
    "professionareas/:id/edit": "edit"
  )

