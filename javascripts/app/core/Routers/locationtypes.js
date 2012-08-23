#! ce._core.routers.Locationtypes extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Locationtypes = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "locationtypes/:id/show": "show"
    "locationtypes/:id/edit": "edit"
  )

