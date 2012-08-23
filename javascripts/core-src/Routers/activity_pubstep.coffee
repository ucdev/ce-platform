#! ce._core.routers.Activity_pubstep.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Activity_pubstep.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "activity_pubstep.coffee/:id/show": "show"
    "activity_pubstep.coffee/:id/edit": "edit"
  )

