#! ce._core.routers.Project.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Project.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "project.coffee/:id/show": "show"
    "project.coffee/:id/edit": "edit"
  )

