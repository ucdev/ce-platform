#! ce._core.routers.Objecttypes extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Objecttypes = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "objecttypes/:id/show": "show"
    "objecttypes/:id/edit": "edit"
  )

