#! ce._core.routers.Activity_sites extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Activity_sites = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "activity_sites/:id/show": "show"
    "activity_sites/:id/edit": "edit"
  )

