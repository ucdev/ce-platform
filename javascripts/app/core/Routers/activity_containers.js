#! ce._core.routers.Activity_containers extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Activity_containers = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "activity_containers/:id/show": "show"
    "activity_containers/:id/edit": "edit"
  )

