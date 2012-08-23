#! ce._core.routers.Activity_notes extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Activity_notes = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "activity_notes/:id/show": "show"
    "activity_notes/:id/edit": "edit"
  )

