#! ce._core.routers.Activity_tags extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Activity_tags = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "activity_tags/:id/show": "show"
    "activity_tags/:id/edit": "edit"
  )

