#! ce._core.routers.Activity_pubcomponent.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Activity_pubcomponent.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "activity_pubcomponent.coffee/:id/show": "show"
    "activity_pubcomponent.coffee/:id/edit": "edit"
  )

