#! ce._core.routers.Activity_credit.coffee extends Backbone.Marionette.AppRouter 
ce.module "_core.routers", (self, ce, Backbone, Marionette, $, _) ->
  self.Activity_credit.coffee = Backbone.Marionette.AppRouter.extend(appRoutes:
    "": "index"
    "activity_credit.coffee/:id/show": "show"
    "activity_credit.coffee/:id/edit": "edit"
  )

