#! ce._core.routers.Assessments extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Assessments = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "assessments/:id/show": "show"
    "assessments/:id/edit": "edit"
  )

