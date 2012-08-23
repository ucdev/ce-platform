#! ce._core.routers.Person_notes extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Person_notes = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "person_notes/:id/show": "show"
    "person_notes/:id/edit": "edit"
  )

