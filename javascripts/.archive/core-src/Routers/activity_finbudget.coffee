#! ce._core.routers.Activity_finbudget.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Activity_finbudget.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "activity_finbudget.coffee/:id/show": "show"
    "activity_finbudget.coffee/:id/edit": "edit"
  )

