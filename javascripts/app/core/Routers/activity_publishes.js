#! ce._core.routers.Activity_publishes extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Activity_publishes = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "activity_publishes/:id/show": "show"
    "activity_publishes/:id/edit": "edit"
  )

