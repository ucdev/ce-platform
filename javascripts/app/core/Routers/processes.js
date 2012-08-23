#! ce._core.routers.Processes extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Processes = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "processes/:id/show": "show"
    "processes/:id/edit": "edit"
  )

