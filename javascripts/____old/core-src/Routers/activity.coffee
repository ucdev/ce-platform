#! ce._core.routers.Activity.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Activity.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "activity.coffee/:id/show": "show"
    "activity.coffee/:id/edit": "edit"
  )

