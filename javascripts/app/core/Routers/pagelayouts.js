#! ce._core.routers.Pagelayouts extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Pagelayouts = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "pagelayouts/:id/show": "show"
    "pagelayouts/:id/edit": "edit"
  )

