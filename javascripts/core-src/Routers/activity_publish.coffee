#! ce._core.routers.Activity_publish.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Activity_publish.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "activity_publish.coffee/:id/show": "show"
    "activity_publish.coffee/:id/edit": "edit"
  )

