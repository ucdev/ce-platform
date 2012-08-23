#! ce._core.routers.Activity_votes extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Activity_votes = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "activity_votes/:id/show": "show"
    "activity_votes/:id/edit": "edit"
  )

