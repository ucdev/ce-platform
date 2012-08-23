#! ce._core.routers.Activity_credits extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Activity_credits = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "activity_credits/:id/show": "show"
    "activity_credits/:id/edit": "edit"
  )

