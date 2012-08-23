#! ce._core.routers.Activity_note.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Activity_note.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "activity_note.coffee/:id/show": "show"
    "activity_note.coffee/:id/edit": "edit"
  )

