#! ce._core.routers.Activity_cdc.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Activity_cdc.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "activity_cdc.coffee/:id/show": "show"
    "activity_cdc.coffee/:id/edit": "edit"
  )

