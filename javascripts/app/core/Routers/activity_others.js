#! ce._core.routers.Activity_others extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Activity_others = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "activity_others/:id/show": "show"
    "activity_others/:id/edit": "edit"
  )

