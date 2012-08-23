#! ce._core.routers.Activity_finsupports extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Activity_finsupports = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "activity_finsupports/:id/show": "show"
    "activity_finsupports/:id/edit": "edit"
  )

