#! ce._core.routers.Person_note.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Person_note.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "person_note.coffee/:id/show": "show"
    "person_note.coffee/:id/edit": "edit"
  )

