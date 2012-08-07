#! ce._core.routers.Activity_participants extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Activity_participants = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "activity_participants/:id/show": "show"
    "activity_participants/:id/edit": "edit"
  )

