#! ce._core.routers.Grouptypes extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Grouptypes = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "grouptypes/:id/show": "show"
    "grouptypes/:id/edit": "edit"
  )

