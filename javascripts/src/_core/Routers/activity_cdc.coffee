#! ce._core.routers.Activity_cdc extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Activity_cdc = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "activity_cdc/:id/show": "show"
    "activity_cdc/:id/edit": "edit"
  )

