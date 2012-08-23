#! ce._core.routers.Imagetypes extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Imagetypes = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "imagetypes/:id/show": "show"
    "imagetypes/:id/edit": "edit"
  )

