#! ce._core.routers.Activity_finbudgets extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Activity_finbudgets = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "activity_finbudgets/:id/show": "show"
    "activity_finbudgets/:id/edit": "edit"
  )

