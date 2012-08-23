#! ce._core.routers.Projects extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Projects = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "projects/:id/show": "show"
    "projects/:id/edit": "edit"
  )

