#! ce._core.routers.Relicensures extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Relicensures = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "relicensures/:id/show": "show"
    "relicensures/:id/edit": "edit"
  )

