#! ce._core.routers.Actions extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Actions = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "actions/:id/show": "show"
    "actions/:id/edit": "edit"
  )

