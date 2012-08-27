#! ce._core.routers.Activity_application.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Activity_application.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "activity_application.coffee/:id/show": "show"
    "activity_application.coffee/:id/edit": "edit"
  )

