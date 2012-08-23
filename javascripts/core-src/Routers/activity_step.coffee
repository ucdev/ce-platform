#! ce._core.routers.Activity_step.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Activity_step.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "activity_step.coffee/:id/show": "show"
    "activity_step.coffee/:id/edit": "edit"
  )

