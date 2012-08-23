#! ce._core.routers.Activity_finfees extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Activity_finfees = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "activity_finfees/:id/show": "show"
    "activity_finfees/:id/edit": "edit"
  )

