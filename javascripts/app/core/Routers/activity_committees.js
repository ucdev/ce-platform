#! ce._core.routers.Activity_committees extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Activity_committees = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "activity_committees/:id/show": "show"
    "activity_committees/:id/edit": "edit"
  )

