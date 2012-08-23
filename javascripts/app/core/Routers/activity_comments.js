#! ce._core.routers.Activity_comments extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Activity_comments = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "activity_comments/:id/show": "show"
    "activity_comments/:id/edit": "edit"
  )

