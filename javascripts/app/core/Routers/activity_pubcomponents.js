#! ce._core.routers.Activity_pubcomponents extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Activity_pubcomponents = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "activity_pubcomponents/:id/show": "show"
    "activity_pubcomponents/:id/edit": "edit"
  )

