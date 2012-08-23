#! ce._core.routers.Activity_container.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Activity_container.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "activity_container.coffee/:id/show": "show"
    "activity_container.coffee/:id/edit": "edit"
  )

