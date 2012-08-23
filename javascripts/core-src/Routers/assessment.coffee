#! ce._core.routers.Assessment.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Assessment.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "assessment.coffee/:id/show": "show"
    "assessment.coffee/:id/edit": "edit"
  )

