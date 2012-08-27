#! ce._core.routers.Activity_accme.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Activity_accme.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "activity_accme.coffee/:id/show": "show"
    "activity_accme.coffee/:id/edit": "edit"
  )

