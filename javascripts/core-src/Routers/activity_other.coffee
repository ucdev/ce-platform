#! ce._core.routers.Activity_other.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Activity_other.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "activity_other.coffee/:id/show": "show"
    "activity_other.coffee/:id/edit": "edit"
  )

