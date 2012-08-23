#! ce._core.routers.Objectfieldtypes extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Objectfieldtypes = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "objectfieldtypes/:id/show": "show"
    "objectfieldtypes/:id/edit": "edit"
  )

