#! ce._core.routers.Activity_participant.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Activity_participant.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "activity_participant.coffee/:id/show": "show"
    "activity_participant.coffee/:id/edit": "edit"
  )

